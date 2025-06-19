import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIUtils {
  static const RadialGradient primaryGradient = RadialGradient(
    center: Alignment.topLeft,
    radius: 3,
    focal: Alignment.bottomRight,
    focalRadius: 0.1,
    colors: [Color(0xFF52B5FF), Color(0xFF2BACFF), Color(0xFF0570E1), Color(0xFF1C5D99)],
    stops: [-0.2, 0.6, 1, 1.2],
    transform: GradientRotation(1.8),
  );

  static List<BoxShadow> shadow = [
    BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 8, offset: const Offset(0, 2)),
    BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4)),
  ];

  static BorderRadius borderRadius24 = BorderRadius.circular(24);
  static BorderRadius borderRadius20 = BorderRadius.circular(20);
  static BorderRadius borderRadius16 = BorderRadius.circular(16);
  static BorderRadius borderRadius12 = BorderRadius.circular(12);
  static BorderRadius borderRadius10 = BorderRadius.circular(10);
  static BorderRadius borderRadius4 = BorderRadius.circular(4);

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
