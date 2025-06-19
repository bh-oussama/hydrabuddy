extension TypeEXT<T> on T? {
  R? let<R>(R? Function(T) cb) {
    if (this == null) {
      return null;
    }

    return cb(this as T);
  }
}
