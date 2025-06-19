import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/utils.dart';
import '../../extensions/color_scheme.dart';
import '../../extensions/context.dart';
import '../../extensions/date_time.dart';
import '../../generated/l10n.dart';
import '../../providers/unit.dart';
import '../../widgets/stat.dart';
import '../async.dart';
import 'month/month_grid.dart';
import 'month/provider.dart';

class WidgetInsightsMonth extends StatelessWidget {
  const WidgetInsightsMonth({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().startOfMonth;

    return WidgetAsync(
      provider: monthInsightsProvider(date: date),
      builder: (context, ref, insights) {
        if (insights.noData) {
          return _buildEmptyState(context, S.current.noDataThisMonth, S.current.startTrackingToSeeYourMonthlyProgress);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            _buildSummary(context, insights.totalForMonth, insights.daysMetGoal, insights.bestStreak, insights.average),
            _buildGrid(context, date: DateTime.now().startOfMonth),
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

  Container _buildGrid(BuildContext context, {required DateTime date}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: UIUtils.borderRadius12,
        boxShadow: UIUtils.shadow,
      ),
      child: WidgetMonthGrid(date: date),
    );
  }

  Container _buildSummary(BuildContext context, int totalForMonth, int daysMetGoal, int bestStreak, int average) {
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
            children: [
              Icon(Icons.calendar_month, color: context.colorScheme.primary, size: 28),
              const SizedBox(width: 8),
              Text(
                S.current.thisMonth,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          _buildSummaryStats(totalForMonth, daysMetGoal, bestStreak, average),
        ],
      ),
    );
  }

  Consumer _buildSummaryStats(int totalForMonth, int daysMetGoal, int bestStreak, int average) {
    return Consumer(
      builder: (context, ref, _) {
        final unit = ref.watch(volumetricUnitProvider);

        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.75,
          padding: EdgeInsets.zero,
          children: [
            WidgetStat(
              label: S.current.total,
              value: unit.formatValue(totalForMonth),
              icon: Icons.water_drop,
              color: context.colorScheme.primary,
            ),
            WidgetStat(
              label: S.current.goalMetOnDays,
              value: daysMetGoal.toString(),
              icon: Icons.check_circle_outline,
              color: context.colorScheme.success,
            ),
            WidgetStat(
              label: S.current.bestStreak,
              value: bestStreak.toString(),
              icon: Icons.local_fire_department,
              color: context.colorScheme.warning,
            ),
            WidgetStat(
              label: S.current.averagePerDay,
              value: unit.formatValue(average),
              icon: Icons.leaderboard,
              color: context.colorScheme.secondary,
            ),
          ],
        );
      },
    );
  }
}
