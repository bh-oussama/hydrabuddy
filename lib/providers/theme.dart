import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydra_buddy/extensions/object.dart';
import 'package:hydra_buddy/extensions/theme_mode.dart';

part 'theme.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeKey = 'app_theme';

  @override
  Future<ThemeMode> build() {
    return _loadTheme();
  }

  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode.name);
    state = AsyncData(mode);
  }

  Future<ThemeMode> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_themeKey);

    final ThemeMode? theme = themeString.let(ExtensionThemeMode.fromString);

    return theme ?? ThemeMode.system;
  }
}
