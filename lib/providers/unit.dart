import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../enum/temperature_unit.dart';
import '../enum/volumetric_unit.dart';
import '../enum/weight_unit.dart';
import 'current_user.dart';

part 'unit.g.dart';

@riverpod
TemperatureUnit temperatureUnit(Ref ref) {
  return ref.watch(currentUserProvider).valueOrNull?.temperatureUnit ?? TemperatureUnit.celsius;
}

@riverpod
VolumetricUnit volumetricUnit(Ref ref) {
  return ref.watch(currentUserProvider).valueOrNull?.volumetricUnit ?? VolumetricUnit.milliliter;
}

@riverpod
WeightUnit weightUnit(Ref ref) {
  return ref.watch(currentUserProvider).valueOrNull?.weightUnit ?? WeightUnit.kg;
}
