import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../UI/utils.dart';
import '../../enum/volumetric_unit.dart';
import '../../extensions/color_scheme.dart';
import '../../extensions/context.dart';
import '../../extensions/date_time.dart';
import '../../extensions/duration.dart';
import '../../extensions/list.dart';
import '../../extensions/object.dart';
import '../../generated/l10n.dart';
import '../../models/goal.dart';
import '../../models/intake.dart';
import '../../pages/insights.dart';
import '../../providers/goal.dart';
import '../../providers/intakes.dart';
import '../../providers/progress.dart';
import '../../providers/unit.dart';
import '../async.dart';
import '../error.dart';

part 'today.g.dart';

@riverpod
Future<_InsightsForDay> insightsForDay(Ref ref, {required DateTime date}) async {
  final List<Intake> intakes = await ref.watch(intakesForDayProvider(date: date.startOfDay).future);
  final Goal? goal = await ref.watch(goalForDateProvider(date: date).future);

  return (goal: goal, intakes: intakes);
}

@riverpod
Future<({_InsightsForDay today, _InsightsForDay yesterday})> insightsForToday(Ref ref) async {
  final today = await ref.watch(insightsForDayProvider(date: DateTime.now().startOfDay).future);
  if (today.goal == null) {
    throw Exception('No goal found for today');
  }

  final yesterday = await ref.watch(
    insightsForDayProvider(date: DateTime.now().startOfDay.subtract(const Duration(days: 1))).future,
  );

  return (today: today, yesterday: yesterday);
}

typedef _InsightsForDay = ({Goal? goal, List<Intake> intakes});

class WidgetInsightsToday extends StatelessWidget {
  const WidgetInsightsToday({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetAsync(
      provider: insightsForTodayProvider,
      builder: (context, ref, ({_InsightsForDay today, _InsightsForDay yesterday}) data) {
        final VolumetricUnit unit = ref.watch(volumetricUnitProvider);

        final int targetForToday = data.today.goal?.hydrationTarget ?? 0;
        final int totalIntakeForToday = data.today.intakes.totalIntake;
        final double progressForToday = targetForToday > 0
            ? (totalIntakeForToday / targetForToday).clamp(0.0, 1.0)
            : 0.0;
        final bool goalMet = targetForToday > 0 && totalIntakeForToday >= targetForToday;

        final sortedIntakesOfToday = data.today.intakes.sorted((a, b) => -a.entryAt.compareTo(b.entryAt));

        final Duration? sinceLast = sortedIntakesOfToday.lastOrNull.let(
          (intake) => DateTime.now().difference(intake.entryAt),
        );

        if (data.today.intakes.isEmpty) {
          return _buildEmptyState(context, S.current.noIntakesToday, S.current.startTrackingYourWaterIntake);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            _buildSummary(context, unit, totalIntakeForToday, targetForToday, goalMet, progressForToday),
            _buildLastIntake(sinceLast, context),
            _buildIntakesList(context, sortedIntakesOfToday, unit),
            _buildCompareToYesterday(context),
            _buildComment(context),
          ],
        );
      },
    );
  }

  Widget buildProgress(BuildContext context) {
    return WidgetAsync(
      provider: progressForTodayProvider,
      builder: (context, ref, double? progress) {
        if (progress == null) {
          return WidgetError(S.current.failedToCalculateWaterIntakeGoal);
        }

        return SizedBox.square(
          dimension: 75,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                strokeCap: StrokeCap.round,
                backgroundColor: context.colorScheme.tertiary.withAlpha(38),
                semanticsLabel: S.current.progress,
                semanticsValue: NumberFormat.percentPattern().format(progress),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    NumberFormat.percentPattern().format(progress),
                    style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComment(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: context.colorScheme.primary.withAlpha(20), borderRadius: UIUtils.borderRadius10),
      child: WidgetAsync(
        provider: progressForTodayProvider,
        builder: (context, ref, progress) {
          final bool isGoalMet = (progress ?? 0) >= 1;
          return Row(
            children: [
              Icon(isGoalMet ? Icons.emoji_events : Icons.info_outline, color: context.colorScheme.primary, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isGoalMet ? S.current.greatJobGoalReached : S.current.keepGoingGoalNotReached,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCompareToYesterday(BuildContext context) {
    return WidgetAsync(
      provider: insightsForTodayProvider,
      builder: (context, ref, ({_InsightsForDay today, _InsightsForDay yesterday}) data) {
        final int? goalForToday = data.today.goal?.hydrationTarget;
        final int? goalForYesterday = data.yesterday.goal?.hydrationTarget;
        if (goalForToday == null || goalForYesterday == null || goalForToday == 0 || goalForYesterday == 0) {
          return const SizedBox.shrink();
        }

        final double progressForToday = data.today.intakes.totalIntake / goalForToday;
        final double progressForYesterday = data.yesterday.intakes.totalIntake / goalForYesterday;

        final int difference = ((progressForToday - progressForYesterday) * 100).floor();

        return Row(
          children: [
            Icon(
              difference >= 0 ? Icons.arrow_upward : Icons.arrow_downward,
              color: difference >= 0 ? context.colorScheme.success : context.colorScheme.error,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text(
              difference >= 0 ? '+$difference%' : '$difference%',
              style: context.textTheme.bodyMedium?.copyWith(
                color: difference >= 0 ? context.colorScheme.success : context.colorScheme.error,
              ),
            ),
            const SizedBox(width: 8),
            Text(S.current.comparedToYesterday, style: context.textTheme.bodyMedium),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius20,
        boxShadow: UIUtils.shadow,
      ),
      child: Column(
        children: [
          Icon(Icons.water_drop_outlined, color: context.colorScheme.primary, size: 64),
          const SizedBox(height: 16),
          Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIntakesList(BuildContext context, List<Intake> sortedIntakes, VolumetricUnit unit) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: UIUtils.borderRadius12,
        boxShadow: UIUtils.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.current.todayIntakes, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 300, minHeight: 50),
            child: ListView.separated(
              itemCount: sortedIntakes.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(color: Colors.black12, height: 4, thickness: 0.5);
              },
              itemBuilder: (context, index) {
                final Intake intake = sortedIntakes[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Image.asset(intake.icon, height: 24, width: 20),
                      const SizedBox(width: 8),
                      Text(
                        unit.formatValue(intake.volume),
                        style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Text(DateFormat('hh:mm a').format(intake.entryAt.toLocal()), style: context.textTheme.bodyMedium),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row _buildLastIntake(Duration? sinceLast, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: context.colorScheme.secondary, size: 18),
        const SizedBox(width: 6),
        if (sinceLast != null)
          Text(S.current.lastIntakeSince(sinceLast.agoText), style: context.textTheme.bodyMedium)
        else
          Text(S.current.noIntakesToday, style: context.textTheme.bodyMedium),
      ],
    );
  }

  Container _buildSummary(
    BuildContext context,
    VolumetricUnit unit,
    int total,
    int goal,
    bool goalMet,
    double progress,
  ) {
    return Container(
      width: double.infinity,
      height: PageInsights.summaryCardHeight,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius16,
        boxShadow: UIUtils.shadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.today, color: context.colorScheme.primary, size: 28),
                    Text(
                      S.current.today,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primary,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final VolumetricUnit unit = ref.watch(volumetricUnitProvider);

                    return Text(
                      '${unit.formatValue(total)} / ${unit.formatValue(goal)}',
                      style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text(
                  goalMet ? S.current.goalMet : S.current.leftToGoal(unit.formatValue(goal - total)),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: goalMet ? context.colorScheme.success : context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          buildProgress(context),
        ],
      ),
    );
  }
}
