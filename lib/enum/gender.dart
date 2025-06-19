import 'package:collection/collection.dart';

import '../generated/l10n.dart';

enum Gender {
  male('M'),
  female('F');

  final String persistentValue;

  const Gender(this.persistentValue);

  String get l10n => switch (this) {
    Gender.male => S.current.male,
    Gender.female => S.current.female,
  };

  static Gender? fromString(String value) {
    return Gender.values.firstWhereOrNull((element) => element.persistentValue == value);
  }
}
