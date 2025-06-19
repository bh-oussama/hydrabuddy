import 'package:flutter/material.dart';

class ProgressClipper extends CustomClipper<Path> {
  // from 0 to 1
  final double progress;
  ProgressClipper({required this.progress});

  @override
  Path getClip(Size size) {
    return Path()..addRect(Rect.fromLTWH(0, size.height * (1 - progress), size.width, size.height * progress));
  }

  @override
  bool shouldReclip(covariant ProgressClipper oldClipper) {
    return progress != oldClipper.progress;
  }
}
