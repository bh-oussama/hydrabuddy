import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../UI/utils.dart';
import '../dialogs/intake_volume.dart';
import '../extensions/context.dart';
import '../models/intake_volume.dart';
import '../providers/intake_volumes.dart';
import '../providers/unit.dart';

class WidgetIntakeVolumeItem extends ConsumerWidget {
  final IntakeVolume intakeVolume;

  const WidgetIntakeVolumeItem({super.key, required this.intakeVolume});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: UIUtils.borderRadius12,
        border: Border.all(color: context.colorScheme.outline, width: 1),
      ),
      height: 82,
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 12),
          SizedBox(child: VerticalDivider(color: Colors.black12, thickness: 1)),
          Expanded(child: _buildContent(context)),
          _buildEditIcon(context),
          _buildDeleteIcon(ref, context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          intakeVolume.name,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Consumer(
          builder: (context, ref, child) {
            return Text(
              ref.watch(volumetricUnitProvider).formatValue(intakeVolume.volume),
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDeleteIcon(WidgetRef ref, BuildContext context) {
    return IconButton(
      onPressed: () {
        ref.read(intakeVolumesProvider.notifier).delete(intakeVolume.id);
      },
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.error.withAlpha(25),
        shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius10),
      ),
      icon: Icon(Icons.delete_outline, color: context.colorScheme.error, size: 20),
    );
  }

  Widget _buildEditIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        DialogIntakeVolume.edit(existingIntakeVolume: intakeVolume).show(context);
      },
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.info.withAlpha(25),
        shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius10),
      ),
      icon: Icon(Icons.edit_outlined, color: context.colorScheme.info, size: 20),
    );
  }

  Widget _buildIcon() {
    return SizedBox.square(dimension: 40, child: Image.asset(intakeVolume.image));
  }
}
