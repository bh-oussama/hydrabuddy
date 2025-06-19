import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../enum/female_status.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';
import '../enum/temperature_unit.dart';
import '../enum/volumetric_unit.dart';
import '../enum/weight_unit.dart';
import '../models/registry.dart';
import '../models/user.dart';
import '../utils/convert.dart';

part 'current_user.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  late final _repo = Registry().getRepository<User>() as RepositoryUser;

  @override
  Future<User?> build() async {
    final List<User> allUsers = await _repo.getAll();
    if (allUsers.length != 1) {
      return null;
    }

    return allUsers.first;
  }

  FutureOr<void> setAge(int age) {
    final user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(age: age));
    }

    return _persistData();
  }

  FutureOr<void> setFemaleStatus(FemaleStatus? status) {
    final User? user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(femaleStatus: status));
    }

    return _persistData();
  }

  FutureOr<void> setGender(Gender gender) {
    final User? user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(gender: gender));
    }

    if (gender == Gender.female && user.femaleStatus == null) {
      setFemaleStatus(FemaleStatus.none);
    }

    return _persistData();
  }

  FutureOr<void> setName(String name) {
    final User? user = state.valueOrNull;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(name: name));
    }

    return _persistData();
  }

  FutureOr<void> setPhysicalActivityLevel(PhysicalActivityLevel level) {
    final User? user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(physicalActivityLevel: level));
    }

    return _persistData();
  }

  FutureOr<void> setTemperatureUnit(TemperatureUnit value) {
    final user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(temperatureUnit: value));
    }

    return _persistData();
  }

  FutureOr<void> setVolumetricUnit(VolumetricUnit value) {
    final user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    } else {
      state = AsyncData(user.copyWith(volumetricUnit: value));
    }

    return _persistData();
  }

  FutureOr<void> setWeight(int weight, WeightUnit unit) {
    final User? user = state.value;
    if (user == null) {
      throw Exception('Unexpected null user');
    }

    final int weightInKg = unit == WeightUnit.lb ? poundsToKg(weight) : weight;

    state = AsyncData(user.copyWith(weight: weightInKg, weightUnit: unit));

    return _persistData();
  }

  FutureOr<void> _persistData() {
    final User? user = state.value;
    if (user == null) {
      return null;
    }

    return _repo.save(user);
  }
}
