import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydra_buddy/extensions/date_time.dart';
import 'package:hydra_buddy/models/registry.dart';
import 'package:hydra_buddy/models/user.dart';
import 'package:hydra_buddy/models/weather.dart';
import 'package:hydra_buddy/providers/current_user.dart';
import 'package:hydra_buddy/providers/weather.dart';

import '../enum/female_status.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';
import '../models/goal.dart';

part 'goal.g.dart';

@Riverpod(keepAlive: true)
Future<Goal?> goalForDate(Ref ref, {required DateTime date}) async {
  final repo = Registry().getRepository<Goal>() as RepositoryGoal;

  return repo.getByDate(date);
}

@Riverpod(keepAlive: true)
Future<Map<DateTime, Goal>> goalForRange(Ref ref, {required DateTime start, required DateTime end}) async {
  final repo = Registry().getRepository<Goal>() as RepositoryGoal;

  return repo.getInRange(start, end);
}

@Riverpod(keepAlive: true)
Future<Goal?> waterIntakeGoalForToday(Ref ref) async {
  final User? user = await ref.watch(currentUserProvider.future);
  if (user == null) {
    return null;
  }

  final repo = Registry().getRepository<Goal>() as RepositoryGoal;
  final Goal? existingGoal = await repo.getByDate(DateTime.now());
  if (existingGoal != null) {
    if (user.weight == existingGoal.weightInKg &&
        user.age == existingGoal.age &&
        user.gender == existingGoal.gender &&
        user.femaleStatus == existingGoal.femaleStatus &&
        user.physicalActivityLevel == existingGoal.activityLevel) {
      return existingGoal;
    }

    await repo.delete(existingGoal.id);
  }

  final int? weight = user.weight;
  final int? age = user.age;
  final Gender? gender = user.gender;
  final PhysicalActivityLevel? physicalActivityLevel = user.physicalActivityLevel;
  if (weight == null || age == null || gender == null || physicalActivityLevel == null) {
    return null;
  }

  final Weather? weather = await ref.watch(weatherProvider.future);

  final int? weatherTemperature = weather?.temperature;
  final int? weatherHumidity = weather?.humidity;

  final DateTime date = DateTime.now().startOfDay.toUtc();
  final FemaleStatus? femaleStatus = user.femaleStatus;

  return repo.create(
    date: date,
    weatherTemperature: weatherTemperature,
    weatherHumidity: weatherHumidity,
    femaleStatus: femaleStatus,
    weight: weight,
    age: age,
    gender: gender,
    activityLevel: physicalActivityLevel,
    hydrationEffect: weather?.getHydrationAdvice().hydrationEffect ?? 0,
  );
}
