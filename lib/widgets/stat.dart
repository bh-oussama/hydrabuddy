import 'package:flutter/material.dart';
import 'package:hydra_buddy/extensions/context.dart';

class WidgetStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const WidgetStat({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 4,
      children: [
        Icon(icon, color: color, size: 32),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: context.textTheme.labelMedium?.copyWith(color: Colors.grey.shade800),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                value,
                style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
