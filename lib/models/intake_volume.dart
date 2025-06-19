import 'dart:async';

import 'package:hydra_buddy/extensions/future_or.dart';
import 'package:hydra_buddy/extensions/object.dart';
import 'package:hydra_buddy/models/repository.dart';

import 'model.dart';

class IntakeVolume extends Model {
  final String name;
  final int volume;
  final String image;
  final DateTime entryAt;
  final DateTime? deletedAt;

  const IntakeVolume({
    required super.id,
    required this.name,
    required this.volume,
    required this.image,
    required this.entryAt,
    required this.deletedAt,
  });

  IntakeVolume copyWith({String? name, int? volume, String? image, DateTime? entryAt, DateTime? deletedAt}) {
    return IntakeVolume(
      id: id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      image: image ?? this.image,
      entryAt: entryAt ?? this.entryAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}

class RepositoryIntakeVolumes extends Repository<IntakeVolume> {
  RepositoryIntakeVolumes(super.database);

  @override
  String get tableName => 'intake_volumes';

  @override
  FutureOr<void> buildTable() async {
    await database.execute('''
    CREATE TABLE IF NOT EXISTS intake_volumes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        entry_at TEXT DEFAULT (strftime('%FT%TZ', 'now')),
        name TEXT,
        volume INTEGER,
        image TEXT,
        deleted_at TEXT DEFAULT NULL
        )
    ''');

    await _createInitialRows();
  }

  Future<IntakeVolume> create({required int volume, required String name, required String image}) async {
    final int result = await database.insert(tableName, {
      'name': name,
      'volume': volume,
      'image': image,
      'entry_at': DateTime.now().toUtc().toIso8601String(),
    });

    return getById(result);
  }

  @override
  FutureOr<IntakeVolume> fromDatastore(Map<String, Object?> row) {
    return IntakeVolume(
      id: row['id'] as int,
      entryAt: DateTime.parse(row['entry_at'] as String),
      volume: row['volume'] as int,
      name: row['name'] as String,
      image: row['image'] as String,
      deletedAt: (row['deleted_at'] as String?).let((value) => DateTime.parse(value)),
    );
  }

  Future<List<IntakeVolume>> getAll() async {
    final List<Map<String, Object?>> data = await database.query(
      tableName,
      orderBy: 'entry_at ASC',
      where: 'deleted_at IS NULL',
    );

    return data.map((row) => fromDatastore(row)).wait();
  }

  @override
  Map<String, Object?> toDatastore(IntakeVolume model) {
    return {
      'id': model.id,
      'entry_at': model.entryAt.toUtc().toIso8601String(),
      'name': model.name,
      'volume': model.volume,
      'image': model.image,
      'deleted_at': model.deletedAt?.toUtc().toIso8601String(),
    };
  }

  Future<void> _createInitialRows() async {
    final rows = await database.query(tableName, limit: 1);
    final needToCreateInitialRows = rows.isEmpty;

    if (needToCreateInitialRows == false) {
      return;
    }

    const List<({String name, int volume, String image})> initialEntries = [
      (name: 'Cup', volume: 200, image: 'icons/cup.png'),
      (name: 'Pitcher', volume: 240, image: 'icons/mug.png'),
      (name: 'Bottle', volume: 500, image: 'icons/bottle-1.png'),
      (name: 'Jug', volume: 1000, image: 'icons/bottle-2.png'),
      (name: 'Bottle & Cup', volume: 1000, image: 'icons/bottle-3-cup.png'),
    ];

    for (final entry in initialEntries) {
      await create(volume: entry.volume, name: entry.name, image: entry.image);
    }
  }
}
