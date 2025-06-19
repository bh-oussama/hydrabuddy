import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../UI/utils.dart';
import '../../../enum/volumetric_unit.dart';
import '../../../extensions/color_scheme.dart';
import '../../../extensions/context.dart';
import '../../../extensions/date_time.dart';
import '../../../extensions/list.dart';
import '../../../generated/l10n.dart';
import '../../../providers/unit.dart';
import '../../async.dart';
import '../../day_circle.dart';
import '../../stat.dart';
import 'provider.dart';

part 'view.g.dart';

@riverpod
Future<({DataWeekInsights currentWeek, DataWeekInsights previousWeek})> weekInsights(Ref ref) async {
  final DateTime today = DateTime.now().startOfDay;

  final DataWeekInsights currentWeek = await ref.watch(dataWeekInsightsProvider(week: today).future);
  final DataWeekInsights previousWeek = await ref.watch(
    dataWeekInsightsProvider(week: today.subtract(const Duration(days: 7))).future,
  );

  return (currentWeek: currentWeek, previousWeek: previousWeek);
}

class WidgetInsightsWeek extends StatelessWidget {
  const WidgetInsightsWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetAsync(
      provider: weekInsightsProvider,
      builder: (context, ref, ({DataWeekInsights currentWeek, DataWeekInsights previousWeek}) data) {
        final DataWeekInsights currentWeek = data.currentWeek;
        final DataWeekInsights previousWeek = data.previousWeek;

        if (currentWeek.hasData == false) {
          return _buildEmptyState(context, S.current.noDataThisWeek, S.current.startTrackingToSeeYourWeeklyProgress);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            _buildSummary(context, currentWeek: currentWeek, previousWeek: previousWeek),
            _buildDailyValues(context, data: currentWeek),
            _buildHighlights(context, data: currentWeek),
            const Divider(),
            if (currentWeek.daysWhereGoalWasMet.length < 4) _buildComment(context),
          ],
        );
      },
    );
  }

  Container _buildComment(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: context.colorScheme.primary.withAlpha(20), borderRadius: UIUtils.borderRadius10),
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.info_outline, color: context.colorScheme.primary, size: 18),
          Expanded(child: Text(S.current.stayHydrated, style: context.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Container _buildDailyValues(BuildContext context, {required DataWeekInsights data}) {
    final now = DateTime.now();
    final List<DateTime> weekDays = List.generate(7, (i) => now.startOfWeek.add(Duration(days: i)));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: UIUtils.borderRadius12,
        boxShadow: UIUtils.shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (i) {
          final DateTime date = weekDays[i];

          final bool isToday = date.isSameDay(now);

          return Column(
            spacing: 4,
            children: [
              WidgetDayCircle(
                day: date.day,
                value: data.getIntakes(date).totalIntake,
                goal: data.getGoal(date)?.hydrationTarget ?? 0,
              ),
              Text(
                DateFormat('E').format(date),
                style: context.textTheme.labelSmall?.copyWith(fontWeight: isToday ? FontWeight.bold : null),
              ),
            ],
          );
        }),
      ),
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

  Widget _buildHighlights(BuildContext context, {required DataWeekInsights data}) {
    final bestDayData = data.bestDay;
    final worstDayData = data.worstDay;

    if (bestDayData == null && worstDayData == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        if (bestDayData != null)
          Row(
            children: [
              Icon(Icons.star, color: context.colorScheme.primary, size: 18),
              const SizedBox(width: 4),
              Text(
                S.current.bestDayWithValue(
                  bestDayData.date,
                  bestDayData.intakes.totalIntake / bestDayData.goal.hydrationTarget,
                ),
                style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 12),
            ],
          ),

        if (worstDayData != null)
          Row(
            children: [
              Icon(Icons.sentiment_dissatisfied, color: context.colorScheme.warning, size: 18),
              const SizedBox(width: 4),
              Text(
                S.current.lowestDayWithValue(
                  worstDayData.date,
                  worstDayData.intakes.totalIntake / worstDayData.goal.hydrationTarget,
                ),
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildSummary(
    BuildContext context, {
    required DataWeekInsights currentWeek,
    required DataWeekInsights previousWeek,
  }) {
    final int diffTotal = currentWeek.totalIntake - previousWeek.totalIntake;
    final int diffDaysMet = currentWeek.daysWhereGoalWasMet.length - previousWeek.daysWhereGoalWasMet.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: context.colorScheme.primaryGradient,
        borderRadius: UIUtils.borderRadius16,
        boxShadow: UIUtils.shadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(Icons.calendar_view_week, color: context.colorScheme.primary, size: 28),
              Text(
                S.current.thisWeek,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          _buildSummaryStatNumbers(currentWeek),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildSummaryComparisonToPastWeek(diffTotal, context)),
              Expanded(child: _buildSummaryGoalMetOnDays(diffDaysMet, context)),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildSummaryComparisonToPastWeek(int diffTotal, BuildContext context) {
    return Row(
      children: [
        Icon(
          diffTotal >= 0 ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
          color: diffTotal >= 0 ? context.colorScheme.success : context.colorScheme.error,
          size: 16,
        ),
        Expanded(
          child: Text(
            S.current.compareToLastWeek(diffTotal),
            style: context.textTheme.labelSmall?.copyWith(
              color: diffTotal >= 0 ? context.colorScheme.success : context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildSummaryGoalMetOnDays(int diffDaysMet, BuildContext context) {
    return Row(
      children: [
        Icon(
          diffDaysMet >= 0 ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
          color: diffDaysMet >= 0 ? context.colorScheme.success : context.colorScheme.error,
          size: 16,
        ),
        Expanded(
          child: Text(
            S.current.metGoalOnDays(diffDaysMet),
            style: context.textTheme.labelSmall?.copyWith(
              color: diffDaysMet >= 0 ? context.colorScheme.success : context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }

  Consumer _buildSummaryStatNumbers(DataWeekInsights currentWeek) {
    return Consumer(
      builder: (context, ref, _) {
        final VolumetricUnit unit = ref.watch(volumetricUnitProvider);

        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.75,
          padding: EdgeInsets.zero,
          children: [
            WidgetStat(
              label: S.current.total,
              value: unit.formatValue(currentWeek.totalIntake),
              icon: Icons.water_drop,
              color: context.colorScheme.primary,
            ),
            WidgetStat(
              label: S.current.goalMetOnDays,
              value: currentWeek.daysWhereGoalWasMet.length.toString(),
              icon: Icons.check_circle_rounded,
              color: context.colorScheme.success,
            ),
            WidgetStat(
              label: S.current.bestStreak,
              value: currentWeek.bestStreak.toString(),
              icon: Icons.local_fire_department_rounded,
              color: context.colorScheme.warning,
            ),
            WidgetStat(
              label: S.current.averagePerDayAbbreviation,
              value: unit.formatValue(currentWeek.average),
              icon: Icons.leaderboard,
              color: context.colorScheme.secondary,
            ),
          ],
        );
      },
    );
  }
}
