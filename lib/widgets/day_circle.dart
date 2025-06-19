import 'package:flutter/material.dart';

import '../extensions/context.dart';

class WidgetDayCircle extends StatelessWidget {
  final int day;
  final int value;
  final int goal;

  late final bool goalReached = progress >= 1.0;
  late final double progress = goal > 0 ? (value / goal).clamp(0.0, 1.0) : 0.0;

  WidgetDayCircle({super.key, required this.day, required this.value, required this.goal});

  @override
  Widget build(BuildContext context) {
    final Color? color = Color.lerp(context.colorScheme.tertiary, context.colorScheme.primary, progress.clamp(0, 1));

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 5,
                valueColor: color == null ? null : AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
          Text(
            day.toString(),
            style: context.textTheme.labelMedium?.copyWith(
              color: goalReached ? context.colorScheme.primary : Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Color emptyColor(BuildContext context) => context.colorScheme.tertiary;

  static Color fullColor(BuildContext context) => context.colorScheme.primary;
}
