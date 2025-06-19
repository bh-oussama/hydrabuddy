import 'package:flutter/material.dart';
import 'package:hydra_buddy/UI/light_theme.dart';

import '../UI/custom_color_scheme.dart';
import '../UI/dark_theme.dart';

extension ExtensionBuildContext on BuildContext {
  CustomColorScheme get colorScheme {
    return switch (Theme.of(this).brightness) {
      Brightness.light => lightTheme.colorScheme as CustomColorScheme,
      Brightness.dark => darkTheme.colorScheme as CustomColorScheme,
    };
  }

  TextTheme get textTheme {
    return TextTheme.of(this);
  }
}
