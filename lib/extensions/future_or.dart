import 'dart:async';

extension FutureOrExtension<T> on FutureOr<T> {
  FutureOr<R> then<R>(FutureOr<R> Function(T value) onValue) {
    final value = this;
    if (value is Future<T>) {
      return value.then(onValue);
    }

    return onValue(value);
  }
}

extension FutureOrListExtension<T> on Iterable<FutureOr<T>> {
  FutureOr<List<T>> wait() {
    final List<T> result = [];

    for (int i = 0; i < length; i++) {
      final FutureOr<T> futureOr = elementAt(i);
      if (futureOr is T) {
        result.add(futureOr);
      } else {
        return _waitAsync(i, result);
      }
    }

    return result;
  }

  FutureOr<List<T>> _waitAsync(int startIndex, List<T> result) async {
    for (int i = startIndex; i < length; i++) {
      final FutureOr<T> futureOr = elementAt(i);
      if (futureOr is T) {
        result.add(futureOr);
      } else {
        result.add(await futureOr);
      }
    }

    return result;
  }
}
