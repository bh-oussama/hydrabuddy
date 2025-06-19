import 'package:flutter/material.dart';

extension ExtensionColorScheme on ColorScheme {
  Gradient get primaryGradient {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [surface, surfaceContainerHighest],
      stops: [0.3, 1.5],
    );
  }
}
