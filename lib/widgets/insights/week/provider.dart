import 'package:collection/collection.dart';
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
Future<DataWeekInsights> dataWeekInsights(Ref ref, {required DateTime week}) async {
  final goals = await ref.watch(goalForRangeProvider(start: week.startOfWeek, end: week.endOfWeek).future);
  final intakes = await ref.watch(intakesInRangeProvider(start: week.startOfWeek, end: week.endOfWeek).future);

  return DataWeekInsights(week: week.startOfWeek, goals: goals, intakes: intakes);
}

class DataWeekInsights {
  final DateTime week;
  final Map<DateTime, Goal> _goals;

  final Map<DateTime, List<Intake>> _intakes;

  late final int daysWithValues = _intakes.length;

  late final int average = daysWithValues == 0 ? 0 : totalIntake ~/ daysWithValues;

  late final bool hasData = _goals.isEmpty == false || _intakes.isNotEmpty;

  late final int totalIntake = _intakes.values.flattened.totalIntake;

  final List<DateTime> daysWhereGoalWasMet = [];

  late final ({DateTime date, Goal goal, List<Intake> intakes})? bestDay;

  late final ({DateTime date, Goal goal, List<Intake> intakes})? worstDay;

  late final int bestStreak;

  DataWeekInsights({
    required this.week,
    required Map<DateTime, Goal> goals,
    required Map<DateTime, List<Intake>> intakes,
  }) : _goals = goals,
       _intakes = intakes {
    int bestStreak = 0;
    int currentStreak = 0;

    DateTime currentDate = week;

    double? worstProgress;
    ({DateTime date, Goal goal, List<Intake> intakes})? worstDay;

    double? bestProgress;
    ({DateTime date, Goal goal, List<Intake> intakes})? bestDay;

    while (currentDate.isBefore(week.endOfWeek) || currentDate.isAtSameMomentAs(week.endOfWeek)) {
      final Goal? goal = getGoal(currentDate);
      final List<Intake> intakes = getIntakes(currentDate);

      if (goal == null) {
        currentStreak = 0;
      } else {
        final progress = intakes.totalIntake / goal.hydrationTarget;

        if (worstProgress == null || worstProgress < progress) {
          worstProgress = progress;
          worstDay = (date: currentDate, goal: goal, intakes: intakes);
        }

        if (bestProgress == null || bestProgress < progress) {
          bestProgress = progress;
          bestDay = (date: currentDate, goal: goal, intakes: intakes);
        }

        if (progress >= 1) {
          daysWhereGoalWasMet.add(currentDate);
          currentStreak++;
          if (currentStreak > bestStreak) {
            bestStreak = currentStreak;
          }
        } else {
          currentStreak = 0;
        }
      }

      currentDate = currentDate.add(const Duration(days: 1));
    }

    this.bestStreak = bestStreak;
    this.worstDay = worstDay;
    this.bestDay = bestDay;
  }

  Goal? getGoal(DateTime date) => _goals[date];

  List<Intake> getIntakes(DateTime date) => _intakes[date] ?? [];
}
