import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

class Storage {
  static final Storage instance = Storage._();

  Database? _database;

  bool _isInitialized = false;

  Storage._();

  Database get database {
    final db = _database;
    if (db == null) {
      throw Exception('init must be called and awaited before trying to access database');
    }

    return db;
  }

  FutureOr<void> closeDatabase() {
    assert(_isInitialized);

    final database = _database;
    if (database == null) {
      return null;
    }

    _database = null;

    return database.close();
  }

  FutureOr<void> init() {
    if (_isInitialized) {
      return null;
    }

    _isInitialized = true;

    WidgetsFlutterBinding.ensureInitialized();

    return _openDatabase().then((database) {
      _database = database;
    });
  }

  Future<Database> _openDatabase() async {
    final String path = await getDatabasesPath();
    return openDatabase(join(path, 'water_intake.db'));
  }
}
