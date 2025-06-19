import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydra_buddy/extensions/date_time.dart';
import 'package:hydra_buddy/models/registry.dart';

import '../models/intake.dart';
import '../models/intake_volume.dart';

part 'intakes.g.dart';

@riverpod
Future<List<Intake>> intakesForDay(Ref ref, {required DateTime date}) {
  final repo = Registry().getRepository<Intake>() as RepositoryIntakes;

  return repo.getForDay(date);
}

@riverpod
Future<Map<DateTime, List<Intake>>> intakesInRange(Ref ref, {required DateTime start, required DateTime end}) {
  final repo = Registry().getRepository<Intake>() as RepositoryIntakes;

  return repo.getInRange(start, end);
}

@riverpod
class IntakeForToday extends _$IntakeForToday {
  late final _repo = Registry().getRepository<Intake>() as RepositoryIntakes;

  Future<void> addIntake(int volume) async {
    await _repo.createWithVolume(volume);

    ref.invalidateSelf();
    _invalidateProviders();
  }

  Future<void> addIntakeFromIntakeVolume(IntakeVolume intakeVolume) async {
    await _repo.createWithIntakeVolume(intakeVolume);

    ref.invalidateSelf();
    _invalidateProviders();
  }

  @override
  Future<List<Intake>> build() async {
    return _repo.getForDay(DateTime.now());
  }

  Future<void> removeIntake(int id) async {
    await _repo.delete(id);

    ref.invalidateSelf();
    _invalidateProviders();
  }

  /// Invaliding providers which are dependent on intakes for today
  void _invalidateProviders() {
    final DateTime now = DateTime.now();
    ref.invalidate(intakesForDayProvider(date: now.startOfDay.endOfWeek));
    ref.invalidate(intakesInRangeProvider(start: now.startOfWeek, end: now.endOfWeek));
    ref.invalidate(intakesInRangeProvider(start: now.startOfMonth, end: now.endOfMonth));
  }
}
