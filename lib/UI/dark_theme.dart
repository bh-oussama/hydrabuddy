import 'package:flutter/material.dart';
import 'package:hydra_buddy/UI/ui.dart';

import 'custom_color_scheme.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),

  colorScheme: CustomColorScheme(
    brightness: Brightness.dark,
    primary: Brand.primary,
    onPrimary: Color(0xFF001D36),
    primaryContainer: Color(0xFF003258),
    onPrimaryContainer: Color(0xFFD1E4FF),

    secondary: Brand.secondary,
    onSecondary: Color(0xFF00363D),
    secondaryContainer: Color(0xFF004F58),
    onSecondaryContainer: Color(0xFFB2EBF2),

    tertiary: Color(0xFF64B5F6),
    onTertiary: Color(0xFF001D36),
    tertiaryContainer: Color(0xFF004A77),
    onTertiaryContainer: Color(0xFFD1E4FF),

    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    surface: Color(0xFF0F1419),
    onSurface: Color(0xFFE1E6EA),
    surfaceContainer: Color(0xFF1F2933),
    surfaceContainerHighest: Color(0xFF252525),
    onSurfaceVariant: Color(0xFFB8C4CA),

    outline: Color(0xFF6B7278),
    outlineVariant: Color(0xFF2A3036),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFE1E6EA),
    onInverseSurface: Color(0xFF2E3135),
    inversePrimary: Color(0xFF0570E1),

    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    info: Color(0xFF2196F3),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F1419),
    foregroundColor: Color(0xFFE1E6EA),
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
  ),

  cardTheme: CardThemeData(
    color: const Color(0xFF1A1F24),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Color(0xFF2A3036), width: 1),
    ),
    shadowColor: const Color(0xFF000000),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1A1F24),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A3036)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A3036)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF4A94E8), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFFFB4AB)),
    ),
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4A94E8),
      foregroundColor: const Color(0xFF001D36),
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF4A94E8);
      }
      return const Color(0xFF6B7278);
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF4A94E8).withValues(alpha: 0.3);
      }
      return const Color(0xFF2A3036);
    }),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1A1F24),
    selectedItemColor: Color(0xFF4A94E8),
    unselectedItemColor: Color(0xFF6B7278),
    elevation: 0,
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 54,
      fontWeight: FontWeight.bold,
      color: Color(0xFFE1E6EA),
    ),
    displayMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE1E6EA),
    ),
    displaySmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE1E6EA),
    ),

    headlineLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE1E6EA),
    ),
    headlineMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE1E6EA),
    ),
    headlineSmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Color(0xFFE1E6EA),
    ),

    titleLarge: TextStyle(fontFamily: Fonts.dosis, fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFFE1E6EA)),
    titleMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFFE1E6EA),
    ),
    titleSmall: TextStyle(fontFamily: Fonts.dosis, fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFB8C4CA)),

    bodyLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFE1E6EA),
    ),
    bodyMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFFB8C4CA),
    ),
    bodySmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF6B7278),
    ),

    labelLarge: TextStyle(fontFamily: Fonts.dosis, fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFE1E6EA)),
    labelMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFFB8C4CA),
    ),
    labelSmall: TextStyle(fontFamily: Fonts.dosis, fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF6B7278)),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xFF4A94E8), // primary color for dark theme
    linearTrackColor: Color(0xFF2A3036), // outlineVariant for track
    circularTrackColor: Color(0xFF2A3036), // outlineVariant for track
  ),
);
