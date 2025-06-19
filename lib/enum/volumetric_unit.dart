import 'package:hydra_buddy/utils/convert.dart';

import '../generated/l10n.dart';

enum VolumetricUnit {
  milliliter('ml'),
  ounce('oz');

  final String persistentValue;

  const VolumetricUnit(this.persistentValue);

  String get l10n {
    return switch (this) {
      milliliter => S.current.milliliter,
      ounce => S.current.ounce,
    };
  }

  String formatValue(int value, {bool isExtraText = false}) {
    if (isExtraText) {
      return switch (this) {
        milliliter => S.current.extraIntakeInMilliliter(value),
        ounce => S.current.extraIntakeInOunce(millilitersToOunces(value)),
      };
    }

    return switch (this) {
      milliliter => S.current.amountInML(value),
      ounce => S.current.amountInOunce(millilitersToOunces(value)),
    };
  }

  static VolumetricUnit? fromString(String value) {
    return VolumetricUnit.values.firstWhere((element) => element.persistentValue == value);
  }
}
