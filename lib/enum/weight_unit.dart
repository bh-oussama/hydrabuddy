import '../generated/l10n.dart';

enum WeightUnit {
  kg('Kg'),
  lb('Lb');

  final String persistentValue;

  const WeightUnit(this.persistentValue);

  String get l10n {
    return switch (this) {
      kg => S.current.kg,
      lb => S.current.pounds,
    };
  }

  String formatValue(int value) {
    return switch (this) {
      kg => S.current.kgAmount(value),
      lb => S.current.lbAmount(value),
    };
  }

  static WeightUnit? fromString(String value) {
    return WeightUnit.values.firstWhere((element) => element.persistentValue == value);
  }
}
