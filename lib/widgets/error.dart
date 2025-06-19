import 'package:flutter/material.dart';

import '../extensions/context.dart';

class WidgetError extends StatelessWidget {
  final String error;

  const WidgetError(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.error)),
    );
  }
}
