import 'package:flutter/material.dart';
import 'package:hydra_buddy/UI/ui.dart';

import 'custom_color_scheme.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFFDFDFD),
  colorScheme: CustomColorScheme(
    brightness: Brightness.light,

    primary: Brand.primary,
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE3F2FD),
    onPrimaryContainer: Color(0xFF001D36),

    secondary: Brand.secondary,
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE0F7FA),
    onSecondaryContainer: Color(0xFF001F24),

    tertiary: Color(0xFF64B5F6),
    onTertiary: Color(0xFF001D36),
    tertiaryContainer: Color(0xFF004A77),
    onTertiaryContainer: Color(0xFFD1E4FF),

    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFFFFF),
    surfaceContainer: Color(0xFFFAFAFA),
    surfaceContainerLowest: Color(0xFFFDFDFD),
    onSurface: Color(0xFF1a1a1a),
    surfaceContainerHighest: Color(0xFFF5F5F5),
    onSurfaceVariant: Color(0xFF6b6b6b),
    outline: Color(0xFFE0E0E0),
    outlineVariant: Color(0xFFF0F0F0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFF9ECAFF),

    success: Color(0xFF4CAF50),
    warning: Color(0xFFFF9800),
    info: Color(0xFF2196F3),
  ),

  listTileTheme: ListTileThemeData(
    tileColor: Color(0xFFFAFAFA),
    selectedTileColor: Color(0xFFF5F5F5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Color(0xFFE8E8E8), width: 0.5),
    ),
  ),

  dividerTheme: DividerThemeData(color: Color(0xFFF0F0F0), thickness: 1),

  appBarTheme: const AppBarTheme(
    backgroundColor: Brand.primary,
    foregroundColor: Color(0xFFFFFFFF),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF)),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Brand.primary,
      foregroundColor: Color(0xFFFFFFFF),
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Brand.secondary,
    foregroundColor: Color(0xFFFFFFFF),
    elevation: 6,
  ),

  cardTheme: CardThemeData(
    color: Color(0xFFFFFFFF),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: Color(0xFFF0F0F0), width: 1),
    ),
    shadowColor: Colors.black.withValues(alpha: 0.08),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF5F5F5),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.all(16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFFE8E8E8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Brand.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade400, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade400, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFF0F0F0), width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade400, width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
  ),

  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Brand.primary,
    linearTrackColor: Color(0xFFE3F2FD),
    circularTrackColor: Color(0xFFE3F2FD),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 54,
      fontWeight: FontWeight.bold,
      color: Color(0xFF1C1B1F),
    ),
    displayMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 45,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1C1B1F),
    ),
    displaySmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1C1B1F),
    ),

    headlineLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1C1B1F),
    ),
    headlineMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1C1B1F),
    ),
    headlineSmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1C1B1F),
    ),

    titleLarge: TextStyle(fontFamily: Fonts.dosis, fontSize: 22, fontWeight: FontWeight.w500, color: Color(0xFF1C1B1F)),
    titleMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF1C1B1F),
    ),
    titleSmall: TextStyle(fontFamily: Fonts.dosis, fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF49454F)),

    bodyLarge: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFF1C1B1F),
    ),
    bodyMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color(0xFF49454F),
    ),
    bodySmall: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Color(0xFF79747E),
    ),

    labelLarge: TextStyle(fontFamily: Fonts.dosis, fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1C1B1F)),
    labelMedium: TextStyle(
      fontFamily: Fonts.dosis,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFF49454F),
    ),
    labelSmall: TextStyle(fontFamily: Fonts.dosis, fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF79747E)),
  ),
  fontFamily: Fonts.notoSans,
);
