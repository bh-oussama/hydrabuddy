import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hydra_buddy/models/registry.dart';

import '../models/intake_volume.dart';

part 'intake_volumes.g.dart';

@riverpod
Future<IntakeVolume?> intakeVolume(Ref ref, int id) async {
  return Registry().getRepository<IntakeVolume>().getById(id);
}

@riverpod
class IntakeVolumes extends _$IntakeVolumes {
  late final _repo = Registry().getRepository<IntakeVolume>() as RepositoryIntakeVolumes;

  Future<IntakeVolume> add({required int volume, required String name, required String image}) async {
    final model = await _repo.create(volume: volume, name: name, image: image);

    ref.invalidateSelf();

    return model;
  }

  @override
  Future<List<IntakeVolume>> build() {
    return _repo.getAll();
  }

  Future<void> delete(int id) async {
    await _repo.delete(id);

    ref.invalidateSelf();
  }

  Future<IntakeVolume> edit(IntakeVolume model) async {
    await _repo.save(model);

    ref.invalidateSelf();

    return _repo.getById(model.id);
  }
}
