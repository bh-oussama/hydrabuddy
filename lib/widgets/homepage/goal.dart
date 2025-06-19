import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../UI/utils.dart';
import '../../extensions/color_scheme.dart';
import '../../extensions/context.dart';
import '../../extensions/list.dart';
import '../../generated/l10n.dart';
import '../../models/goal.dart';
import '../../models/intake.dart';
import '../../providers/goal.dart';
import '../../providers/intakes.dart';
import '../../providers/unit.dart';
import '../../widgets/async.dart';
import '../../widgets/error.dart';

class WidgetHomepageGoal extends StatefulWidget {
  const WidgetHomepageGoal({super.key});

  @override
  State<WidgetHomepageGoal> createState() => _WidgetHomepageGoalState();
}

class _WidgetHomepageGoalState extends State<WidgetHomepageGoal> with TickerProviderStateMixin {
  late final AnimationController animationControllerProgress = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius20,
        boxShadow: UIUtils.shadow,
      ),
      child: Row(
        spacing: 24,
        children: [
          AspectRatio(aspectRatio: 1, child: buildProgress(context)),
          Expanded(child: buildInfo(context)),
        ],
      ),
    );
  }

  Widget buildInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.goal,
          style: context.textTheme.labelLarge?.copyWith(
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        WidgetAsync(
          provider: waterIntakeGoalForTodayProvider,
          builder: (context, ref, Goal? goal) {
            if (goal == null) {
              return WidgetError(S.current.failedToCalculateWaterIntakeGoal);
            }

            return Text(
              ref.watch(volumetricUnitProvider).formatValue(goal.hydrationTarget),
              style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.water_drop, color: context.colorScheme.primary, size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: WidgetAsync(
                provider: intakeForTodayProvider,
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                builder: (context, ref, List<Intake> data) {
                  final int totalIntake = data.fold<int>(0, (previous, intake) => previous + intake.volume);

                  return Text(
                    S.current.drunkAmount(ref.watch(volumetricUnitProvider).formatValue(totalIntake)),
                    style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        buildRemaining(context),
      ],
    );
  }

  Padding buildProgress(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          WidgetAsync(
            provider: waterIntakeGoalForTodayProvider,
            builder: (context, ref, Goal? goal) {
              if (goal == null) {
                return WidgetError(S.current.failedToCalculateWaterIntakeGoal);
              }

              return WidgetAsync(
                provider: intakeForTodayProvider,
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                builder: (context, ref, List<Intake> data) {
                  animationControllerProgress.animateTo(
                    data.totalIntake / goal.hydrationTarget,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );

                  final animation = Tween<double>(begin: 0, end: 1.0).animate(animationControllerProgress);

                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return CircularProgressIndicator(
                        value: animation.value.toDouble(),
                        strokeWidth: 20,
                        strokeCap: StrokeCap.round,
                        backgroundColor: context.colorScheme.tertiary.withAlpha(38),
                        semanticsLabel: S.current.progress,
                        semanticsValue: NumberFormat.percentPattern().format(animation.value),
                      );
                    },
                  );
                },
              );
            },
          ),
          Center(
            child: WidgetAsync(
              provider: intakeForTodayProvider,
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              builder: (context, ref, List<Intake> data) {
                return Text(
                  ref.watch(volumetricUnitProvider).formatValue(data.totalIntake),
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRemaining(BuildContext context) {
    return WidgetAsync(
      provider: waterIntakeGoalForTodayProvider,
      builder: (context, ref, Goal? goal) {
        if (goal == null) {
          return WidgetError(S.current.failedToCalculateWaterIntakeGoal);
        }

        return WidgetAsync(
          provider: intakeForTodayProvider,
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
          builder: (context, ref, List<Intake> data) {
            final int remaining = goal.hydrationTarget - data.totalIntake;

            if (remaining <= 0) {
              return Row(
                spacing: 6,
                children: [
                  Icon(Icons.check_rounded, color: context.colorScheme.success, size: 20),
                  Expanded(
                    child: Text(
                      S.current.goalReached,
                      style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              );
            }

            return Row(
              spacing: 6,
              children: [
                Icon(Icons.timelapse_rounded, color: context.colorScheme.onSurfaceVariant, size: 20),
                Expanded(
                  child: Text(
                    S.current.remainingValue(ref.watch(volumetricUnitProvider).formatValue(remaining)),
                    style: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    animationControllerProgress.dispose();
    super.dispose();
  }
}
