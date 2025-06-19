import 'dart:async';
import 'dart:math';

import '../enum/female_status.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';
import '../extensions/date_time.dart';
import '../extensions/future_or.dart';
import '../extensions/object.dart';
import '../utils/intake_goal_calculator.dart';
import 'model.dart';
import 'repository.dart';

class Goal extends Model {
  final DateTime date;
  final int? weatherTemperature;
  final int? weatherHumidity;
  final FemaleStatus? femaleStatus;
  final PhysicalActivityLevel activityLevel;
  final int weightInKg;
  final int age;
  final Gender gender;
  final int hydrationEffect;

  late int baseTarget = calculateIntakeGoal(
    activityLevel: activityLevel,
    age: age,
    weightInKg: weightInKg,
    gender: gender,
    femaleStatus: femaleStatus,
  );

  late int hydrationTarget = baseTarget + hydrationEffect;

  Goal({
    required super.id,
    required this.date,
    required this.weatherTemperature,
    required this.weatherHumidity,
    required this.femaleStatus,
    required this.weightInKg,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.hydrationEffect,
  });
}

class RepositoryGoal extends Repository<Goal> {
  RepositoryGoal(super.database);

  @override
  String get tableName => 'goals';

  @override
  FutureOr<void> buildTable() async {
    await database.execute('''
    CREATE TABLE IF NOT EXISTS goals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        weather_temperature INTEGER,
        weather_humidity INTEGER,
        weight INTEGER,
        age INTEGER,
        health_status TEXT,
        female_status TEXT,
        gender TEXT,
        activity_level TEXT,
        hydration_effect INTEGER
        )
    ''');

    await _createDevData();
  }

  Future<Goal> create({
    required DateTime date,
    required int weight,
    required int age,
    required int? weatherTemperature,
    required int? weatherHumidity,
    required FemaleStatus? femaleStatus,
    required Gender gender,
    required PhysicalActivityLevel activityLevel,
    required int hydrationEffect,
  }) async {
    final int result = await database.insert(tableName, {
      'date': date.toLocal().startOfDay.toUtc().toIso8601String(),
      'weather_temperature': weatherTemperature,
      'weather_humidity': weatherHumidity,
      'female_status': femaleStatus?.persistentValue,
      'weight': weight,
      'age': age,
      'gender': gender.persistentValue,
      'activity_level': activityLevel.persistentValue,
      'hydration_effect': hydrationEffect,
    });

    return getById(result);
  }

  @override
  Future<void> delete(int id) {
    return database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  FutureOr<Goal> fromDatastore(Map<String, Object?> row) {
    final PhysicalActivityLevel? activityLevel = PhysicalActivityLevel.fromString(row['activity_level'] as String);
    if (activityLevel == null) {
      throw Exception('physical activity level not found');
    }

    final Gender? gender = Gender.fromString(row['gender'] as String);
    if (gender == null) {
      throw Exception('Gender not found');
    }

    final FemaleStatus? femaleStatus = (row['female_status'] as String?).let(FemaleStatus.fromString);
    if (gender == Gender.female && femaleStatus == null) {
      throw Exception('Female status not found');
    }

    final int id = row['id'] as int;
    final DateTime date = DateTime.parse(row['date'] as String).toLocal();
    final int weatherTemperature = row['weather_temperature'] as int;
    final int weatherHumidity = row['weather_humidity'] as int;
    final int weight = row['weight'] as int;
    final int age = row['age'] as int;
    final int hydrationEffect = row['hydration_effect'] as int;

    return Goal(
      id: id,
      date: date,
      weatherTemperature: weatherTemperature,
      weatherHumidity: weatherHumidity,
      femaleStatus: femaleStatus,
      weightInKg: weight,
      age: age,
      activityLevel: activityLevel,
      gender: gender,
      hydrationEffect: hydrationEffect,
    );
  }

  Future<Goal?> getByDate(DateTime date) async {
    final List<Map<String, Object?>> data = await database.query(
      tableName,
      where: 'date = ?',
      whereArgs: [date.toLocal().startOfDay.toUtc().toIso8601String()],
    );

    if (data.isEmpty) {
      return null;
    }

    if (data.length > 1) {
      throw Exception('More than one goal found for date $date');
    }

    return fromDatastore(data.first);
  }

  Future<Map<DateTime, Goal>> getInRange(DateTime start, DateTime end) async {
    final List<Map<String, Object?>> data = await database.query(
      tableName,
      where: 'date >= ? AND date < ?',
      whereArgs: [start.startOfDay.toUtc().toIso8601String(), end.endOfDay.toUtc().toIso8601String()],
    );

    return data.map((row) => fromDatastore(row)).wait().then((Iterable<Goal> value) {
      return {for (var element in value) element.date: element};
    });
  }

  @override
  FutureOr<Map<String, Object?>> toDatastore(Goal model) {
    return {
      'id': model.id,
      'date': model.date.toLocal().startOfDay.toUtc().toIso8601String(),
      'weather_temperature': model.weatherTemperature,
      'weather_humidity': model.weatherHumidity,
      'female_status': model.femaleStatus?.persistentValue,
      'weight': model.weightInKg,
      'age': model.age,
      'activity_level': model.activityLevel.persistentValue,
      'gender': model.gender.persistentValue,
      'hydration_effect': model.hydrationEffect,
    };
  }

  Future<void> _createDevData() async {
    final DateTime now = DateTime.now();

    final Goal? goalOfYesterday = await getByDate(now.subtract(const Duration(days: 1)));
    if (goalOfYesterday != null) {
      return;
    }

    final DateTime start = now.subtract(const Duration(days: 90)).startOfDay;
    final DateTime end = now.subtract(const Duration(days: 1)).startOfDay;

    DateTime current = start;

    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      await create(
        date: current,
        weatherTemperature: 20,
        weatherHumidity: 50,
        femaleStatus: null,
        weight: 70,
        age: 30,
        activityLevel: PhysicalActivityLevel.values[Random().nextInt(PhysicalActivityLevel.values.length)],
        gender: Gender.male,
        hydrationEffect: [0, 250, 500, 750, 1000][Random().nextInt(5)],
      );

      current = current.add(const Duration(days: 1));
    }
  }
}
