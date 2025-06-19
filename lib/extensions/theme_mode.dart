import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

extension ExtensionThemeMode on ThemeMode {
  String get l10n {
    switch (this) {
      case ThemeMode.system:
        return S.current.system;
      case ThemeMode.light:
        return S.current.light;
      case ThemeMode.dark:
        return S.current.dark;
    }
  }

  static ThemeMode? fromString(String? value) {
    return ThemeMode.values.firstWhereOrNull((element) => element.name == value);
  }
}
