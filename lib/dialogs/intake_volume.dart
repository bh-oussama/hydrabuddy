import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../UI/utils.dart';
import '../enum/volumetric_unit.dart';
import '../extensions/context.dart';
import '../generated/l10n.dart';
import '../models/intake_volume.dart';
import '../providers/intake_volumes.dart';
import '../providers/unit.dart';

class DialogIntakeVolume extends StatelessWidget {
  final formKey = GlobalKey<FormBuilderState>();

  final IntakeVolume? existingIntakeVolume;

  DialogIntakeVolume.create({super.key}) : existingIntakeVolume = null;

  DialogIntakeVolume.edit({required IntakeVolume this.existingIntakeVolume, super.key});

  String get title {
    final IntakeVolume? volume = existingIntakeVolume;
    if (volume == null) {
      return S.current.addNewVolume;
    }

    return S.current.editVolume(volume.name);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.headlineMedium),
            FormBuilder(
              key: formKey,
              child: Column(spacing: 16, children: [_buildFieldName(), _buildFieldVolume(), _buildFieldIcon()]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 8,
              children: [_buildButtonCancel(context), _buildButtonAdd()],
            ),
          ],
        ),
      ),
    );
  }

  Future<IntakeVolume?> show(BuildContext context) {
    return showDialog<IntakeVolume?>(context: context, builder: (context) => this);
  }

  Widget _buildButtonAdd() {
    return Consumer(
      builder: (context, ref, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
          ),
          onPressed: () => _submit(context, ref),
          child: Text(S.current.add),
        );
      },
    );
  }

  Widget _buildButtonCancel(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.grey.shade600),
      onPressed: () => Navigator.pop(context),
      child: Text(S.current.cancel),
    );
  }

  Widget _buildFieldIcon() {
    return FormBuilderDropdown<String>(
      itemHeight: 48,
      validator: (value) {
        if (value == null) {
          return S.current.required;
        }

        return null;
      },
      name: _Field.icon.name,
      hint: Text(S.current.selectAnIcon),
      initialValue: existingIntakeVolume?.image,
      items:
          <String>[
            'icons/cup.png',
            'icons/mug.png',
            'icons/bottle-1.png',
            'icons/bottle-2.png',
            'icons/bottle-3-cup.png',
          ].map((e) {
            return DropdownMenuItem<String>(value: e, child: Image.asset(e, width: 40, height: 40));
          }).toList(),
    );
  }

  Widget _buildFieldName() {
    return FormBuilderTextField(
      name: _Field.name.name,
      initialValue: existingIntakeVolume?.name,
      decoration: InputDecoration(
        labelText: S.current.name,
        hintText: S.current.enterName,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      validator: (value) {
        if (value == null) {
          return S.current.required;
        }

        return null;
      },
    );
  }

  Widget _buildFieldVolume() {
    return Consumer(
      builder: (context, ref, child) {
        return FormBuilderTextField(
          name: _Field.volume.name,
          keyboardType: TextInputType.number,
          initialValue: existingIntakeVolume?.volume.toString(),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: S.current.enterVolume,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: switch (ref.watch(volumetricUnitProvider)) {
              VolumetricUnit.milliliter => S.current.volumeMilliliterPlaceholder,
              VolumetricUnit.ounce => S.current.volumeOuncePlaceholder,
            },
            suffixText: ref.watch(volumetricUnitProvider).l10n,
          ),
          validator: (value) {
            if (value == null) {
              return S.current.required;
            }

            return null;
          },
        );
      },
    );
  }

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    final FormBuilderState? currentState = formKey.currentState;
    if (currentState == null || currentState.validate() != true) {
      return;
    }

    currentState.save();

    final String name = currentState.value[_Field.name.name] as String;
    final int volume = int.parse(currentState.value[_Field.volume.name] as String);
    final String icon = currentState.value[_Field.icon.name] as String;

    final IntakeVolume? _existingIntakeVolume = existingIntakeVolume;
    final IntakeVolume result;
    if (_existingIntakeVolume == null) {
      result = await ref.watch(intakeVolumesProvider.notifier).add(volume: volume, name: name, image: icon);
    } else {
      result = await ref
          .watch(intakeVolumesProvider.notifier)
          .edit(_existingIntakeVolume.copyWith(name: name, volume: volume, image: icon));
    }

    if (context.mounted) {
      Navigator.pop(context, result);
    }
  }
}

enum _Field { name, volume, icon }
