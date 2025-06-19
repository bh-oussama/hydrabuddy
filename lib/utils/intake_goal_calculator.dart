import '../enum/female_status.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';

int calculateIntakeGoal({
  required int weightInKg,
  required int age,
  required Gender gender,
  required PhysicalActivityLevel activityLevel,
  FemaleStatus? femaleStatus,
}) {
  assert(gender == Gender.male || femaleStatus != null);

  int goal = 0;

  if (age <= 13) {
    goal += 1700;
  } else if (age <= 18) {
    goal += 2200;
  } else {
    goal += switch (gender) {
      Gender.male => weightInKg * 35,
      Gender.female => weightInKg * 30,
    };
  }

  goal += switch (femaleStatus) {
    FemaleStatus.pregnant => 500,
    FemaleStatus.breastfeeding => 1000,
    FemaleStatus.none => 0,
    null => 0,
  };

  final double physicalActivityLevelMultiplier = switch (activityLevel) {
    PhysicalActivityLevel.sedentary => 1,
    PhysicalActivityLevel.light => 1.1,
    PhysicalActivityLevel.moderate => 1.2,
    PhysicalActivityLevel.highlyActive => 1.35,
    PhysicalActivityLevel.extremelyActive => 1.5,
  };

  return (goal * physicalActivityLevelMultiplier).round();
}
