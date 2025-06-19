import 'dart:async';

import 'package:hydra_buddy/extensions/future_or.dart';
import 'package:hydra_buddy/models/model.dart';
import 'package:hydra_buddy/models/repository.dart';

import '../enum/female_status.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';
import '../enum/temperature_unit.dart';
import '../enum/volumetric_unit.dart';
import '../enum/weight_unit.dart';
import '../extensions/object.dart';

class RepositoryUser extends Repository<User> {
  RepositoryUser(super.database);

  @override
  String get tableName => 'user';

  @override
  FutureOr<void> buildTable() async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER,
        weight INTEGER,
        gender TEXT,
        entry_at TEXT DEFAULT (strftime('%FT%TZ', 'now')),
        weight_unit TEXT,
        volumetric_unit TEXT,
        temperature_unit TEXT,
        female_status TEXT,
        physical_activity_level TEXT
        )
    ''');

    try {
      await getById(1);
    } catch (e) {
      await database.insert(tableName, {'id': 1});
    }
  }

  @override
  FutureOr<User> fromDatastore(Map<String, Object?> row) {
    return User(
      id: row['id'] as int,
      name: row['name'] as String?,
      age: row['age'] as int?,
      weight: row['weight'] as int?,
      gender: (row['gender'] as String?).let<Gender>((value) => Gender.fromString(value)),
      weightUnit: (row['weight_unit'] as String?).let<WeightUnit>((value) => WeightUnit.fromString(value)),
      volumetricUnit: (row['volumetric_unit'] as String?).let<VolumetricUnit>(VolumetricUnit.fromString),
      temperatureUnit: (row['temperature_unit'] as String?).let<TemperatureUnit>(TemperatureUnit.fromString),
      femaleStatus: (row['female_status'] as String?).let<FemaleStatus>(FemaleStatus.fromString),
      physicalActivityLevel: (row['physical_activity_level'] as String?).let<PhysicalActivityLevel>(
        PhysicalActivityLevel.fromString,
      ),
    );
  }

  Future<List<User>> getAll() async {
    return database.query(tableName).then((value) {
      return value.map(fromDatastore).wait();
    });
  }

  @override
  FutureOr<Map<String, Object?>> toDatastore(User model) {
    return {
      'id': model.id,
      'name': model.name,
      'age': model.age,
      'weight': model.weight,
      'gender': model.gender?.persistentValue,
      'weight_unit': model.weightUnit?.persistentValue,
      'volumetric_unit': model.volumetricUnit?.persistentValue,
      'temperature_unit': model.temperatureUnit?.persistentValue,
      'female_status': model.femaleStatus?.persistentValue,
      'physical_activity_level': model.physicalActivityLevel?.persistentValue,
    };
  }
}

class User extends Model {
  final String? name;
  final int? age;
  final int? weight;
  final Gender? gender;
  final FemaleStatus? femaleStatus;
  final PhysicalActivityLevel? physicalActivityLevel;
  final WeightUnit? weightUnit;
  final VolumetricUnit? volumetricUnit;
  final TemperatureUnit? temperatureUnit;

  User({
    required super.id,
    this.name,
    this.age,
    this.weight,
    this.gender,
    this.femaleStatus,
    this.physicalActivityLevel,
    this.weightUnit,
    this.volumetricUnit,
    this.temperatureUnit,
  });

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      age,
      weight,
      gender,
      femaleStatus,
      physicalActivityLevel,
      weightUnit,
      volumetricUnit,
      temperatureUnit,
    );
  }

  bool get isOnboardingCompleted {
    return name != null &&
        age != null &&
        weight != null &&
        gender != null &&
        physicalActivityLevel != null &&
        weightUnit != null;
  }

  @override
  bool operator ==(Object other) {
    if (other is! User) return false;

    return id == other.id &&
        name == other.name &&
        age == other.age &&
        weight == other.weight &&
        gender == other.gender &&
        femaleStatus == other.femaleStatus &&
        physicalActivityLevel == other.physicalActivityLevel &&
        weightUnit == other.weightUnit &&
        volumetricUnit == other.volumetricUnit &&
        temperatureUnit == other.temperatureUnit;
  }

  User copyWith({
    String? name,
    int? age,
    int? weight,
    Gender? gender,
    FemaleStatus? femaleStatus,
    PhysicalActivityLevel? physicalActivityLevel,
    WeightUnit? weightUnit,
    VolumetricUnit? volumetricUnit,
    TemperatureUnit? temperatureUnit,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      femaleStatus: femaleStatus ?? this.femaleStatus,
      physicalActivityLevel: physicalActivityLevel ?? this.physicalActivityLevel,
      gender: gender ?? this.gender,
      weightUnit: weightUnit ?? this.weightUnit,
      volumetricUnit: volumetricUnit ?? this.volumetricUnit,
      temperatureUnit: temperatureUnit ?? this.temperatureUnit,
    );
  }
}
