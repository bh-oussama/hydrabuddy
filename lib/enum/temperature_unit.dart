import '../generated/l10n.dart';
import '../utils/convert.dart';

enum TemperatureUnit {
  celsius('C'),
  fahrenheit('F');

  final String persistentValue;

  const TemperatureUnit(this.persistentValue);

  String get l10n {
    return switch (this) {
      celsius => S.current.celsius,
      fahrenheit => S.current.fahrenheit,
    };
  }

  String formatValue(int value) {
    return switch (this) {
      celsius => S.current.celsiusAmount(value),
      fahrenheit => S.current.fahrenheitAmount(celsiusToFahrenheit(value)),
    };
  }

  static TemperatureUnit? fromString(String value) {
    return TemperatureUnit.values.firstWhere((element) => element.persistentValue == value);
  }
}
