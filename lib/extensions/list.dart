import '../models/intake.dart';

extension IterableIntakes on Iterable<Intake> {
  int get totalIntake {
    return fold<int>(0, (sum, intake) => sum + intake.volume);
  }
}
