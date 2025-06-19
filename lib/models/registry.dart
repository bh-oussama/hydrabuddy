import 'dart:async';

import 'model.dart';
import 'repository.dart';

class Registry {
  static final Registry _instance = Registry._();

  final Map<Type, Repository> _repositories = {};

  factory Registry() => _instance;

  Registry._();

  Repository<T> getRepository<T extends Model>() {
    if (!_repositories.containsKey(T)) {
      throw Exception('Repository for $T not registered');
    }

    return _repositories[T]! as Repository<T>;
  }

  FutureOr<void> registerRepository<T extends Model>(Repository<T> repository) {
    if (_repositories.containsKey(T)) {
      throw Exception('Repository for $T already registered');
    }

    _repositories[T] = repository;

    return repository.buildTable();
  }
}
