import '../generated/l10n.dart';

enum FemaleStatus {
  pregnant('pregnant'),
  breastfeeding('breastfeeding'),
  none('none');

  final String persistentValue;

  const FemaleStatus(this.persistentValue);

  String get l10n => switch (this) {
    FemaleStatus.pregnant => S.current.pregnant,
    FemaleStatus.breastfeeding => S.current.breastfeeding,
    FemaleStatus.none => S.current.none,
  };

  static FemaleStatus? fromString(String value) {
    return FemaleStatus.values.firstWhere((element) => element.persistentValue == value);
  }
}
