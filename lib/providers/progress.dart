import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydra_buddy/extensions/list.dart';
import 'package:hydra_buddy/models/goal.dart';
import 'package:hydra_buddy/models/intake.dart';
import 'package:hydra_buddy/providers/goal.dart';
import 'package:hydra_buddy/providers/intakes.dart';

part 'progress.g.dart';

@Riverpod(keepAlive: true)
Future<double?> progressForToday(Ref ref) async {
  final Goal? goal = await ref.watch(waterIntakeGoalForTodayProvider.future);
  if (goal == null) {
    return null;
  }

  if (goal.hydrationTarget == 0) {
    return null;
  }

  final List<Intake> intakes = await ref.watch(intakeForTodayProvider.future);

  return intakes.totalIntake / goal.hydrationTarget;
}
