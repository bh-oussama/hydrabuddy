import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydra_buddy/extensions/color_scheme.dart';
import 'package:hydra_buddy/providers/goal.dart';
import 'package:hydra_buddy/providers/unit.dart';
import 'package:hydra_buddy/widgets/homepage/day_overview.dart' show DayOverview;

import '../UI/utils.dart';
import '../extensions/context.dart';
import '../generated/l10n.dart';
import '../models/intake_volume.dart';
import '../models/user.dart';
import '../providers/current_user.dart';
import '../providers/intake_volumes.dart';
import '../providers/intakes.dart';
import '../widgets/app_bar.dart';
import '../widgets/async.dart';
import '../widgets/homepage/goal.dart';
import '../widgets/nav_bar.dart';
import '../widgets/recent_intakes.dart';

class PageHome extends ConsumerStatefulWidget {
  const PageHome({super.key});

  @override
  ConsumerState<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends ConsumerState<PageHome> {
  static const EdgeInsets padding = EdgeInsets.all(12);
  final GlobalKey<FormState> quickAddFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final User? user = ref.watch(currentUserProvider).value;
    ref.watch(waterIntakeGoalForTodayProvider);

    if (user == null) {
      return Center(
        child: Text(
          S.current.userNotFound,
          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.error),
        ),
      );
    }

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        bottomNavigationBar: WidgetNavBar(),
        appBar: WidgetAppBar(titleText: 'HydraBuddy'),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          padding: mq.padding + padding + EdgeInsets.only(top: WidgetAppBar.height, bottom: WidgetNavBar.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              DayOverview(),
              WidgetHomepageGoal(),
              _buildQuickAdd(context, ref),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: _calculateContentHeight(context)),
                child: const WidgetRecentIntakes(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAdd(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius12,
        boxShadow: UIUtils.shadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.quickAdd,
              style: context.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            _buildQuickAddIntakeVolumes(context, ref),
            const SizedBox(height: 4),
            _buildQuickAddCustomAmount(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAddCustomAmount(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
      color: context.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Form(
          key: quickAddFormKey,
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: TextFormField(
                  style: context.textTheme.labelLarge,
                  maxLength: 4,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (context, {required currentLength, required isFocused, required maxLength}) => null,
                  decoration: InputDecoration(
                    labelText: S.current.customAmount,
                    labelStyle: context.textTheme.bodyLarge,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: S.current.enterAmount,
                    hintStyle: context.textTheme.bodyLarge,
                    suffixText: ref.watch(volumetricUnitProvider).l10n,
                  ),
                  validator: (value) {
                    if (value == null) {
                      return S.current.required;
                    }

                    final parsed = int.tryParse(value);
                    if (parsed == null) {
                      return S.current.invalidValue;
                    }

                    return null;
                  },
                  onSaved: (final String? newValue) {
                    if (newValue == null) {
                      return;
                    }

                    final int? parsed = int.tryParse(newValue);
                    if (parsed == null) {
                      return;
                    }

                    ref.read(intakeForTodayProvider.notifier).addIntake(parsed);
                  },
                ),
              ),
              IconButton(
                style: TextButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  iconColor: context.colorScheme.onPrimary,
                  iconSize: 28,
                  shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
                  padding: const EdgeInsets.all(12),
                ),
                onPressed: _submitIntake,
                icon: Icon(Icons.add, color: context.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAddFromIntakeVolume(BuildContext context, WidgetRef ref, {required IntakeVolume intakeVolume}) {
    return InkWell(
      borderRadius: UIUtils.borderRadius10,
      onTap: () {
        ref.read(intakeForTodayProvider.notifier).addIntakeFromIntakeVolume(intakeVolume);
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary.withAlpha(38),
          borderRadius: UIUtils.borderRadius10,
        ),
        child: Image.asset(intakeVolume.image, width: 40, height: 40),
      ),
    );
  }

  Widget _buildQuickAddIntakeVolumes(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: UIUtils.borderRadius12),
      color: context.colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: WidgetAsync(
          provider: intakeVolumesProvider,
          builder: (context, ref, List<IntakeVolume> data) {
            return GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              childAspectRatio: 1,
              padding: EdgeInsets.zero,
              children: data.map((element) {
                return _buildQuickAddFromIntakeVolume(context, ref, intakeVolume: element);
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  double _calculateContentHeight(BuildContext context) {
    final MediaQueryData mqd = MediaQuery.of(context);

    return mqd.size.height -
        mqd.padding.top -
        mqd.padding.bottom -
        WidgetNavBar.height -
        WidgetAppBar.height -
        padding.vertical;
  }

  void _submitIntake() {
    if (quickAddFormKey.currentState?.validate() != true) {
      return;
    }

    quickAddFormKey.currentState?.save();
    quickAddFormKey.currentState?.reset();
  }
}
