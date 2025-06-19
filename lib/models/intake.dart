import 'dart:async';

import 'package:collection/collection.dart';
import 'package:hydra_buddy/extensions/date_time.dart';

import '../extensions/future_or.dart';
import 'intake_volume.dart';
import 'model.dart';
import 'registry.dart';
import 'repository.dart';

class Intake extends Model {
  final IntakeVolume? intakeVolume;
  final int volume;
  final DateTime entryAt;
  DateTime? deletedAt;

  Intake({required super.id, required this.entryAt, required this.intakeVolume, required this.volume});

  String get icon {
    if (intakeVolume != null) {
      return intakeVolume!.image;
    }

    if (volume <= 300) {
      return 'icons/mug.png';
    }

    if (volume <= 1000) {
      return 'icons/bottle-2.png';
    }

    return 'icons/bottle-3-cup.png';
  }

  @override
  String toString() {
    return '[Intake] id: $id, at: $entryAt, volume: $volume, intakeVolume: ${intakeVolume?.id}';
  }
}

class RepositoryIntakes extends Repository<Intake> {
  RepositoryIntakes(super.database);

  @override
  String get tableName => 'intake';

  @override
  FutureOr<void> buildTable() async {
    await database.execute('''
    CREATE TABLE IF NOT EXISTS intake (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        entry_at TEXT DEFAULT (strftime('%FT%TZ', 'now')),
        intake_volume_id INTEGER,
        volume INTEGER,
        deleted_at TEXT DEFAULT NULL,
        FOREIGN KEY(intake_volume_id) REFERENCES intake_volumes(id)
        )
    ''');

    // TODO: uncomment to create intake data for development
    // await _createDevData();
  }

  Future<Intake> createWithIntakeVolume(IntakeVolume intakeVolume, {DateTime? entryAt}) async {
    final int id = await database.insert(tableName, {
      'volume': intakeVolume.volume,
      'intake_volume_id': intakeVolume.id,
      'entry_at': (entryAt ?? DateTime.now()).toUtc().toIso8601String(),
    });

    return getById(id);
  }

  Future<Intake> createWithVolume(int volume, {DateTime? entryAt}) async {
    final int id = await database.insert(tableName, {
      'volume': volume,
      'intake_volume_id': null,
      'entry_at': (entryAt ?? DateTime.now()).toUtc().toIso8601String(),
    });

    return getById(id);
  }

  @override
  FutureOr<Intake> fromDatastore(Map<String, Object?> row) {
    if (row['intake_volume_id'] != null) {
      return Registry().getRepository<IntakeVolume>().getById(row['intake_volume_id'] as int).then((intakeVolume) {
        return Intake(
          id: row['id'] as int,
          entryAt: DateTime.parse(row['entry_at'] as String).toLocal(),
          intakeVolume: intakeVolume,
          volume: row['volume'] as int? ?? intakeVolume.volume,
        );
      });
    }

    return Intake(
      id: row['id'] as int,
      entryAt: DateTime.parse(row['entry_at'] as String).toLocal(),
      volume: row['volume'] as int,
      intakeVolume: null,
    );
  }

  Future<List<Intake>> getForDay(DateTime date) async {
    final List<Map<String, Object?>> data = await database.query(
      tableName,
      orderBy: 'entry_at DESC',
      where: 'deleted_at IS NULL AND entry_at >= ? AND entry_at < ?',
      whereArgs: [date.startOfDay.toUtc().toIso8601String(), date.endOfDay.toUtc().toIso8601String()],
    );

    return data.map((row) => fromDatastore(row)).wait();
  }

  Future<Map<DateTime, List<Intake>>> getInRange(DateTime start, DateTime end) async {
    final List<Map<String, Object?>> data = await database.query(
      tableName,
      orderBy: 'entry_at DESC',
      where: 'deleted_at IS NULL AND entry_at >= ? AND entry_at < ?',
      whereArgs: [
        start.toLocal().startOfDay.toUtc().toIso8601String(),
        end.toLocal().endOfDay.toUtc().toIso8601String(),
      ],
    );

    return data.map((row) => fromDatastore(row)).wait().then((Iterable<Intake> value) {
      return value.groupListsBy((element) => element.entryAt.toLocal().startOfDay);
    });
  }

  @override
  Map<String, Object?> toDatastore(Intake model) {
    return {
      'id': model.id,
      'entry_at': model.entryAt.toUtc().toIso8601String(),
      'intake_volume_id': model.intakeVolume?.id,
      'volume': null,
      'deleted_at': model.deletedAt?.toUtc().toIso8601String(),
    };
  }

  // Future<void> _createDevData() async {
  //   final DateTime today = DateTime.now().startOfDay;
  //   final DateTime lastDay = today.subtract(const Duration(days: 1));
  //   final DateTime firstDay = today.subtract(const Duration(days: 90));
  //
  //   final Map<DateTime, List<Intake>> allIntakes = await getInRange(firstDay, lastDay);
  //
  //   if (allIntakes.keys.any(
  //     (date) => date.isAfter(firstDay) && date.isBefore(today.subtract(const Duration(days: 7))),
  //   )) {
  //     return;
  //   }
  //
  //   DateTime currentDate = firstDay;
  //
  //   final List<IntakeVolume> intakeVolumes = await (Registry().getRepository<IntakeVolume>() as RepositoryIntakeVolumes)
  //       .getAll();
  //
  //   while (currentDate.isBefore(lastDay) || currentDate.isAtSameMomentAs(lastDay)) {
  //     for (int i = 0; i < 5; i++) {
  //       final randomPick = Random().nextInt(2);
  //
  //       switch (randomPick) {
  //         case 1:
  //           await createWithIntakeVolume(
  //             intakeVolumes[Random().nextInt(intakeVolumes.length)],
  //             entryAt: currentDate.add(Duration(hours: 10 + i)),
  //           );
  //           break;
  //         default:
  //           await createWithVolume(Random().nextInt(1000), entryAt: currentDate.add(Duration(hours: 10 + i)));
  //       }
  //     }
  //
  //     currentDate = currentDate.add(const Duration(days: 1));
  //   }
  // }
}
