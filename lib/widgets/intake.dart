import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../UI/utils.dart';
import '../extensions/context.dart';
import '../models/intake.dart';
import '../providers/intakes.dart';
import '../providers/unit.dart';

class WidgetIntakeItem extends ConsumerWidget {
  final Intake intake;

  const WidgetIntakeItem({super.key, required this.intake});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest,
        borderRadius: UIUtils.borderRadius12,
      ),
      height: 80,
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 12),
          SizedBox(child: VerticalDivider(color: Colors.black12, thickness: 1)),

          Expanded(child: _buildDetails(context)),
          _buildDeleteButton(ref, context),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(WidgetRef ref, BuildContext context) {
    return IconButton(
      onPressed: () {
        ref.read(intakeForTodayProvider.notifier).removeIntake(intake.id);
      },
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.error.withAlpha(25),
        shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius10),
      ),
      icon: Icon(Icons.delete_outline, color: context.colorScheme.error, size: 20),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) {
            return Text(
              ref.watch(volumetricUnitProvider).formatValue(intake.volume),
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.primary,
              ),
            );
          },
        ),
        const SizedBox(height: 4),
        Text(
          DateFormat('hh:mm a').format(intake.entryAt.toLocal()),
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return SizedBox.square(dimension: 40, child: Image.asset(intake.icon));
  }
}
