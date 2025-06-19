import '../generated/l10n.dart';

enum PhysicalActivityLevel {
  sedentary('sedentary'), // sitting most of the day (office work/student with no physical activity)
  light('light'), // less than 30 minutes of physical activity per day (light exercise, walking)
  moderate('moderate'), // less than 40 minutes of physical activity per day (moderate exercise, walking, cycling)
  highlyActive('highlyActive'), //
  extremelyActive('extremelyActive') // heavy physical activity in work or exercise more than 90 minutes every day
  ;

  final String persistentValue;

  const PhysicalActivityLevel(this.persistentValue);

  String get description {
    return switch (this) {
      sedentary => S.current.sedentaryDescription,
      light => S.current.lightDescription,
      moderate => S.current.moderateDescription,
      highlyActive => S.current.highlyActiveDescription,
      extremelyActive => S.current.extremelyActiveDescription,
    };
  }

  String get l10n {
    return switch (this) {
      sedentary => S.current.sedentary,
      light => S.current.light,
      moderate => S.current.moderate,
      highlyActive => S.current.highlyActive,
      extremelyActive => S.current.extremelyActive,
    };
  }

  static PhysicalActivityLevel? fromString(String value) {
    return PhysicalActivityLevel.values.firstWhere((element) => element.persistentValue == value);
  }
}
