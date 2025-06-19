import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../UI/utils.dart';
import '../extensions/color_scheme.dart';
import '../extensions/context.dart';
import '../generated/l10n.dart';
import '../models/intake.dart';
import '../providers/intakes.dart';
import 'async.dart';
import 'intake.dart';

class WidgetRecentIntakes extends ConsumerWidget {
  const WidgetRecentIntakes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius12,
        boxShadow: UIUtils.shadow,
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          _buildTitle(context),
          Flexible(
            child: WidgetAsync(
              provider: intakeForTodayProvider,
              builder: (context, ref, List<Intake> data) {
                if (data.isEmpty) {
                  return _buildEmpty(context);
                }

                return _buildRecentIntakes(data);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: UIUtils.borderRadius12,
      ),
      child: Column(
        children: [
          Icon(Icons.water_drop_outlined, color: context.colorScheme.primary, size: 48),
          const SizedBox(height: 12),
          Text(
            S.current.noIntakesYet,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.current.startTrackingYourWaterIntake,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentIntakes(List<Intake> data) {
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return WidgetIntakeItem(intake: data[index]);
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(Icons.history, color: context.colorScheme.primary, size: 24),
        Text(
          S.current.recentIntakes,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
