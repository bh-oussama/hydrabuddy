import 'dart:async';

import 'package:sqflite/sqlite_api.dart';
import 'package:hydra_buddy/extensions/future_or.dart';

import 'model.dart';

abstract class Repository<T extends Model> {
  final Database database;

  Repository(this.database);

  String get tableName;

  FutureOr<void> buildTable();

  Future<void> delete(int id) {
    return database.update(
      tableName,
      {'deleted_at': DateTime.now().toUtc().toIso8601String()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  FutureOr<T> fromDatastore(Map<String, Object?> row);

  Future<T> getById(int id) async {
    final List<Map<String, Object?>> data = await database.query(tableName, where: 'id = ?', whereArgs: [id]);

    if (data.isEmpty) {
      throw Exception('No data found for id $id in table $tableName');
    }

    return fromDatastore(data.first);
  }

  Future<void> save(T model) {
    return toDatastore(model).then((data) {
      return database.update(
        tableName,
        data,
        where: 'id = ?',
        whereArgs: [model.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  FutureOr<Map<String, Object?>> toDatastore(T model);
}
