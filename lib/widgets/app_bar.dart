import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../UI/utils.dart';
import '../extensions/context.dart';

class WidgetAppBar extends AppBar {
  static const double height = 75;

  WidgetAppBar({super.key, required String titleText})
    : super(
        title: Builder(
          builder: (context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: UIUtils.borderRadius24,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), shape: BoxShape.circle),
                    child: Icon(Icons.water_drop_rounded, color: context.colorScheme.primary, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    titleText,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: height,
        primary: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        flexibleSpace: Builder(
          builder: (context) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        context.colorScheme.primary.withValues(alpha: 0.9),
                        context.colorScheme.tertiary.withValues(alpha: 0.8),
                        context.colorScheme.secondary.withValues(alpha: 0.7),
                      ],
                      stops: const [0.0, 0.6, 1.0],
                    ),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.primary.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: context.colorScheme.secondary.withValues(alpha: 0.1),
                        blurRadius: 40,
                        offset: const Offset(0, 12),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white.withValues(alpha: 0.15), Colors.transparent],
                        stops: const [0.0, 0.3],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
