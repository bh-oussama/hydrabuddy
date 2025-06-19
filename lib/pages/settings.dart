import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydra_buddy/enum/female_status.dart';
import 'package:hydra_buddy/extensions/color_scheme.dart';
import 'package:hydra_buddy/extensions/object.dart';
import 'package:hydra_buddy/providers/theme.dart';
import 'package:hydra_buddy/providers/unit.dart';
import 'package:hydra_buddy/utils/convert.dart';
import 'package:hydra_buddy/widgets/async.dart';
import 'package:hydra_buddy/widgets/intake_volume.dart';

import '../UI/utils.dart';
import '../dialogs/intake_volume.dart';
import '../enum/gender.dart';
import '../enum/physical_activity_level.dart';
import '../enum/temperature_unit.dart';
import '../enum/volumetric_unit.dart';
import '../enum/weight_unit.dart';
import '../extensions/context.dart';
import '../generated/l10n.dart';
import '../models/user.dart';
import '../providers/current_user.dart';
import '../providers/intake_volumes.dart';
import '../widgets/app_bar.dart';
import '../widgets/nav_bar.dart';

class PageSettings extends ConsumerStatefulWidget {
  const PageSettings({super.key});

  @override
  ConsumerState<PageSettings> createState() => _PageSettingsState();
}

enum _Field {
  name,
  age,
  weight,
  gender,
  femaleStatus,
  physicalActivityLevel,
  weightUnit,
  volumetricUnit,
  temperatureUnit,
}

class _PageSettingsState extends ConsumerState<PageSettings> {
  int? weightValue;
  WeightUnit? weightUnit;

  @override
  Widget build(BuildContext context) {
    final User? user = ref.watch(currentUserProvider).value;
    if (user == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator(color: context.colorScheme.primary)),
      );
    }

    return GestureDetector(
      onTap: UIUtils.hideKeyboard,
      child: Scaffold(
        bottomNavigationBar: WidgetNavBar(),
        appBar: WidgetAppBar(titleText: S.current.settings),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          padding:
              MediaQuery.of(context).padding +
              const EdgeInsets.all(12) +
              EdgeInsets.only(top: WidgetAppBar.height, bottom: WidgetNavBar.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              _buildWelcomeHeader(context, user),
              _buildProfileSection(context, ref, user: user),
              _buildPreferencesSection(context, ref, user: user),
              _buildIntakeVolumesSection(context, ref),
              _buildThemeSection(context),
            ],
          ),
        ),
      ),
    );
  }

  FutureOr<void> updateWeightForUser() {
    final int? weight = weightValue;
    final unit = weightUnit;

    if (unit == null || weight == null) {
      return null;
    }

    return ref.read(currentUserProvider.notifier).setWeight(weight, unit);
  }

  Widget _buildActivityLevelInput(BuildContext context, User user, WidgetRef ref) {
    return _buildCard(
      context,
      child: _buildDropdownField<PhysicalActivityLevel>(
        fieldName: _Field.physicalActivityLevel.name,
        label: S.current.physicalActivityLevel,
        icon: Icons.directions_run,
        value: user.physicalActivityLevel,
        items: PhysicalActivityLevel.values,
        itemBuilder: (level) => Text(level.l10n.replaceAll('_', ' ')),
        onChanged: (value) {
          if (value == null) return;
          ref.read(currentUserProvider.notifier).setPhysicalActivityLevel(value);
        },
      ),
      subtitle: S.current.howActiveAreYouOnATypicalDay,
    );
  }

  Widget _buildAgeInput(BuildContext context, User user, WidgetRef ref) {
    return _buildCard(
      context,
      subtitle: S.current.forAccurateHydrationAdvice,
      child: _buildTextField(
        fieldName: _Field.age.name,
        initialValue: user.age.toString(),
        label: S.current.age,
        icon: Icons.cake_outlined,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.required;
          }

          final age = int.tryParse(value);
          if (age == null || age < 3 || age > 120) {
            return S.current.pleaseEnterAValidAge;
          }

          return null;
        },
        onChanged: (value) {
          if (value == null) return;
          final age = int.tryParse(value);
          if (age == null) return;
          ref.read(currentUserProvider.notifier).setAge(age);
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required Widget child, String? subtitle}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(child: child),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 16, color: context.colorScheme.onSurfaceVariant),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required String fieldName,
    required IconData icon,
    required T? value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required Widget Function(T) itemBuilder,
  }) {
    return FormBuilderDropdown<T>(
      key: ValueKey(fieldName),
      name: fieldName,
      initialValue: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(value: item, child: itemBuilder(item));
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: context.colorScheme.primary, size: 20),
      ),
    );
  }

  Widget _buildEmptyIntakeVolumes(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: UIUtils.borderRadius12,
        border: Border.all(color: context.colorScheme.outline, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.water_drop_outlined, color: context.colorScheme.primary, size: 40),
          ),
          const SizedBox(height: 16),
          Text(
            S.current.noCustomVolumes,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.current.addYourPreferredIntakeVolumes,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFemaleStatusInput(BuildContext context, User user, WidgetRef ref) {
    return _buildCard(
      context,
      subtitle: S.current.femaleStatusHelpsTailorHydrationRecommendations,
      child: _buildDropdownField<FemaleStatus>(
        fieldName: _Field.femaleStatus.name,
        label: S.current.femaleStatus,
        icon: Icons.pregnant_woman,
        value: user.femaleStatus,
        items: FemaleStatus.values,
        itemBuilder: (status) => Text(status.l10n),
        onChanged: (value) {
          if (value == null) return;
          ref.read(currentUserProvider.notifier).setFemaleStatus(value);
        },
      ),
    );
  }

  Widget _buildGenderInput(BuildContext context, User user, WidgetRef ref) {
    return _buildCard(
      context,
      subtitle: S.current.genderHelpsTailorHydrationRecommendations,
      child: _buildDropdownField<Gender>(
        fieldName: _Field.gender.name,
        label: S.current.gender,
        icon: Icons.wc,
        value: user.gender,
        items: Gender.values,
        itemBuilder: (gender) => Text(gender.l10n),
        onChanged: (value) {
          if (value == null) return;
          ref.read(currentUserProvider.notifier).setGender(value);
        },
      ),
    );
  }

  Widget _buildIntakeVolumesSection(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.surface, borderRadius: UIUtils.borderRadius20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorScheme.primary.withValues(alpha: 0.05),
                  context.colorScheme.secondary.withValues(alpha: 0.02),
                ],
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: UIUtils.borderRadius12,
                  ),
                  child: Icon(Icons.water_drop, color: context.colorScheme.primary, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    S.current.quickAddVolumes,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 420, minHeight: 200),
                  child: WidgetAsync(
                    provider: intakeVolumesProvider,
                    builder: (context, ref, data) {
                      if (data.isEmpty) {
                        return _buildEmptyIntakeVolumes(context);
                      }

                      return Container(
                        child: ListView.builder(
                          itemCount: data.length,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          itemBuilder: (context, index) {
                            return WidgetIntakeVolumeItem(intakeVolume: data[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => DialogIntakeVolume.create().show(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
                      elevation: 2,
                      shadowColor: context.colorScheme.primary.withValues(alpha: 0.3),
                    ),
                    icon: const Icon(Icons.add, size: 20),
                    label: Text(
                      S.current.addNewVolume,
                      style: context.textTheme.labelLarge?.copyWith(color: context.colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameInput(BuildContext context, User user, WidgetRef ref) {
    return _buildCard(
      context,
      subtitle: S.current.yourNameHelpsPersonalizeYourExperience,
      child: _buildTextField(
        fieldName: _Field.name.name,
        initialValue: user.name,
        label: S.current.name,
        icon: Icons.person_outline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.current.required;
          }
          return null;
        },
        onChanged: (value) {
          if (value == null) return;
          ref.read(currentUserProvider.notifier).setName(value);
        },
      ),
    );
  }

  Widget _buildPreferencesSection(BuildContext context, WidgetRef ref, {required User user}) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.surface, borderRadius: UIUtils.borderRadius20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorScheme.secondary.withValues(alpha: 0.05),
                  context.colorScheme.primary.withValues(alpha: 0.02),
                ],
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary.withValues(alpha: 0.1),
                    borderRadius: UIUtils.borderRadius12,
                  ),
                  child: Icon(Icons.tune, color: context.colorScheme.secondary, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  S.current.preferences,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildActivityLevelInput(context, user, ref),
                _buildVolumeUnitInput(context),
                _buildTemperatureUnitInput(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, WidgetRef ref, {required User user}) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.surface, borderRadius: UIUtils.borderRadius20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildNameInput(context, user, ref),
                _buildAgeInput(context, user, ref),
                _buildWeightInput(context, user),
                _buildGenderInput(context, user, ref),
                if (user.gender == Gender.female) _buildFemaleStatusInput(context, user, ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureUnitInput(BuildContext context) {
    return _buildCard(
      context,
      subtitle: S.current.chooseYourPreferredTemperatureUnit,
      child: Consumer(
        builder: (context, ref, _) {
          return _buildDropdownField<TemperatureUnit>(
            fieldName: _Field.temperatureUnit.name,
            label: S.current.temperatureUnit,
            icon: Icons.device_thermostat,
            value: ref.watch(temperatureUnitProvider),
            items: TemperatureUnit.values,
            onChanged: (value) {
              if (value == null) return;
              ref.read(currentUserProvider.notifier).setTemperatureUnit(value);
            },
            itemBuilder: (unit) => Text(unit.l10n),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String fieldName,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String? value)? validator,
    String? initialValue,
    void Function(String? value)? onChanged,
  }) {
    return FormBuilderTextField(
      name: fieldName,
      initialValue: initialValue,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: (v) {
        onChanged?.call(v);
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: label,
        prefixIcon: Icon(icon, color: context.colorScheme.primary, size: 20),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.surface, borderRadius: UIUtils.borderRadius20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorScheme.warning.withValues(alpha: 0.05),
                  context.colorScheme.primary.withValues(alpha: 0.02),
                ],
              ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.warning.withValues(alpha: 0.1),
                    borderRadius: UIUtils.borderRadius12,
                  ),
                  child: Icon(Icons.palette, color: context.colorScheme.warning, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  S.current.appearance,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.warning,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainerHigh,
                borderRadius: UIUtils.borderRadius12,
                border: Border.all(color: context.colorScheme.outline, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.themeMode,
                        style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        S.current.chooseYourPreferredThemeAppearance,
                        style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    color: context.colorScheme.surface,
                    child: SegmentedButton<ThemeMode>(
                      showSelectedIcon: false,
                      style: SegmentedButton.styleFrom(
                        backgroundColor: context.colorScheme.surface,
                        foregroundColor: context.colorScheme.onSurface,
                        selectedBackgroundColor: context.colorScheme.primary,
                        selectedForegroundColor: context.colorScheme.onPrimary,
                        side: BorderSide(color: context.colorScheme.outline, width: 1),
                        shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
                      ),
                      segments: [
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.light,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.light_mode, size: 16),
                              const SizedBox(width: 8),
                              Text(S.current.light),
                            ],
                          ),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.dark,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [Icon(Icons.dark_mode, size: 16), const SizedBox(width: 8), Text(S.current.dark)],
                          ),
                        ),
                        ButtonSegment<ThemeMode>(
                          value: ThemeMode.system,
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.settings_system_daydream, size: 16),
                              const SizedBox(width: 8),
                              Text(S.current.system),
                            ],
                          ),
                        ),
                      ],
                      selected: {ref.watch(themeNotifierProvider).valueOrNull ?? ThemeMode.system},
                      onSelectionChanged: (Set<ThemeMode> selected) {
                        if (selected.isNotEmpty) {
                          ref.read(themeNotifierProvider.notifier).setTheme(selected.first);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVolumeUnitInput(BuildContext context) {
    return _buildCard(
      context,
      subtitle: S.current.chooseYourPreferredVolumeUnit,
      child: Consumer(
        builder: (context, ref, _) {
          return _buildDropdownField<VolumetricUnit>(
            fieldName: _Field.volumetricUnit.name,
            label: S.current.volumeUnit,
            icon: Icons.local_drink,
            value: ref.watch(volumetricUnitProvider),
            items: VolumetricUnit.values,
            itemBuilder: (unit) => Text(unit.l10n),
            onChanged: (value) {
              if (value == null) return;
              ref.read(currentUserProvider.notifier).setVolumetricUnit(value);
            },
          );
        },
      ),
    );
  }

  Widget _buildWeightInput(BuildContext context, User user) {
    return _buildCard(
      context,
      subtitle: S.current.usedToCalculateYourDailyIntake,
      child: WidgetAsync(
        provider: currentUserProvider.select((AsyncValue<User?> value) {
          if (value.isLoading) {
            return AsyncLoading<int?>();
          }

          if (value.hasError) {
            return AsyncError<int?>(value.error!, value.stackTrace!);
          }

          final User? user = value.value;
          final weightInKg = user?.weight;
          if (user == null || weightInKg == null) {
            return AsyncData<int?>(null);
          }

          if (user.weightUnit == WeightUnit.lb) {
            return AsyncData(kgToPounds(weightInKg));
          }

          return AsyncData(value.value?.weight);
        }),
        builder: (context, ref, int? data) {
          weightUnit = user.weightUnit;
          weightValue = data;

          return FormBuilderTextField(
            name: _Field.weight.name,
            initialValue: data?.toString(),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: S.current.enterYourWeight,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              prefixIcon: Icon(Icons.monitor_weight_outlined, color: context.colorScheme.primary, size: 20),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildWeightUnitToggle(context, initialValue: user.weightUnit),
              ),
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.current.required;
              }

              final int? weight = int.tryParse(value);
              if (weight == null) {
                return S.current.pleaseEnterAValidWeight;
              }

              return null;
            },
            onChanged: (value) {
              final int? weight = value.let(int.tryParse);
              if (weight == null) return;

              weightValue = weight;

              updateWeightForUser();
            },
          );
        },
      ),
    );
  }

  Widget _buildWeightUnitToggle(BuildContext context, {required WeightUnit? initialValue}) {
    return FormBuilderField<WeightUnit>(
      name: _Field.weightUnit.name,
      initialValue: initialValue ?? WeightUnit.kg,
      builder: (FormFieldState<WeightUnit> state) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.colorScheme.outline, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: WeightUnit.values.map((unit) {
              final bool isSelected = state.value == unit;

              return GestureDetector(
                onTap: () {
                  state.didChange(unit);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? context.colorScheme.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    unit.l10n,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: isSelected ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
      validator: (value) {
        if (value == null) {
          return S.current.required;
        }

        return null;
      },
      onChanged: (value) async {
        if (value == null) {
          debugPrintStack(label: 'Weight unit is null');
          return;
        }

        weightUnit = value;

        updateWeightForUser();
      },
    );
  }

  Widget _buildWelcomeHeader(BuildContext context, User user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius20,
        border: Border.all(color: context.colorScheme.primary.withValues(alpha: 0.1), width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.settings, color: context.colorScheme.primary, size: 32),
          ),
          const SizedBox(height: 12),
          Text(
            S.current.welcomeX(user.name ?? ''),

            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            S.current.customizeYourHydrationExperience,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
