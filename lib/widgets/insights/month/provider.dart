import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../extensions/date_time.dart';
import '../../../extensions/list.dart';
import '../../../models/goal.dart';
import '../../../models/intake.dart';
import '../../../providers/goal.dart';
import '../../../providers/intakes.dart';

part 'provider.g.dart';

@riverpod
Future<DataMonthInsights> monthInsights(Ref ref, {required DateTime date}) async {
  final Map<DateTime, Goal> goals = await ref.watch(
    goalForRangeProvider(start: date.startOfMonth, end: date.endOfMonth).future,
  );
  final Map<DateTime, List<Intake>> intakes = await ref.watch(
    intakesInRangeProvider(start: date.startOfMonth, end: date.endOfMonth).future,
  );

  final Map<DateTime, ({Goal? goal, List<Intake>? intakes})> dailyProgress = {};

  final Set<DateTime> dates = {...goals.keys, ...intakes.keys};

  for (final DateTime date in dates) {
    dailyProgress[date] = (goal: goals[date], intakes: intakes[date]);
  }

  return DataMonthInsights._(date, dailyProgress);
}

class DataMonthInsights {
  final DateTime startOfMonth;
  final Map<DateTime, ({Goal? goal, List<Intake>? intakes})> _dataForDay;
  late final int _bestStreak, _daysMetGoal, _average;

  late final bool noData = _dataForDay.values.every((v) => v.intakes?.totalIntake == 0 || v.goal == 0);
  late final int totalForMonth = _dataForDay.values.fold<int>(0, (a, b) => a + (b.intakes?.totalIntake ?? 0));

  DataMonthInsights._(DateTime date, this._dataForDay) : startOfMonth = date.startOfMonth {
    int bestStreak = 0, currentStreak = 0, daysMetGoal = 0, totalIntake = 0;

    for (final MapEntry<DateTime, ({Goal? goal, List<Intake>? intakes})> entry in _dataForDay.entries) {
      final Goal? goal = entry.value.goal;
      final List<Intake>? intakes = entry.value.intakes;
      if (goal == null || intakes == null) {
        continue;
      }

      totalIntake += intakes.totalIntake;

      final int target = goal.hydrationTarget;
      if (target == 0) {
        continue;
      }

      final double progress = intakes.totalIntake / target;
      if (progress >= 1) {
        currentStreak++;
        daysMetGoal++;
        if (currentStreak > bestStreak) {
          bestStreak = currentStreak;
        }
      } else {
        currentStreak = 0;
      }
    }

    _bestStreak = bestStreak;
    _daysMetGoal = daysMetGoal;
    _average = (totalIntake / DateUtils.getDaysInMonth(startOfMonth.year, startOfMonth.month)).round();
  }

  int get average => _average;

  int get bestStreak => _bestStreak;

  int get daysMetGoal => _daysMetGoal;

  int? hydrationTargetForDay(int dayInMonth) {
    if (dayInMonth > DateUtils.getDaysInMonth(startOfMonth.year, startOfMonth.month)) {
      throw Exception('Invalid day in month');
    }

    final DateTime date = startOfMonth.add(Duration(days: dayInMonth));
    return _dataForDay[date]?.goal?.hydrationTarget;
  }

  int? intakeForDay(int dayInMonth) {
    if (dayInMonth > DateUtils.getDaysInMonth(startOfMonth.year, startOfMonth.month)) {
      throw Exception('Invalid day in month');
    }

    final DateTime date = startOfMonth.add(Duration(days: dayInMonth));
    return _dataForDay[date]?.intakes?.totalIntake;
  }
}
