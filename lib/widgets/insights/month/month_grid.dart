import 'package:flutter/material.dart';

import '../../../extensions/context.dart';
import '../../../extensions/date_time.dart';
import '../../../generated/l10n.dart';
import '../../../widgets/async.dart';
import '../../../widgets/day_circle.dart';
import '../../../widgets/insights/month/provider.dart';

class WidgetMonthGrid extends StatelessWidget {
  final DateTime monthStart;

  WidgetMonthGrid({super.key, required DateTime date}) : monthStart = date.startOfMonth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(S.current.monthlyProgress, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        WidgetAsync(
          provider: monthInsightsProvider(date: monthStart),
          builder: (context, ref, data) {
            return _buildGrid(context, insights: data);
          },
        ),
        _buildLegend(context),
      ],
    );
  }

  Widget _buildGrid(BuildContext context, {required DataMonthInsights insights}) {
    final int daysInMonth = DateUtils.getDaysInMonth(monthStart.year, monthStart.month);
    final int offsetInFirstWeek = monthStart.weekday - 1;

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: ((daysInMonth + offsetInFirstWeek) / 7).ceil() * 7,
      itemBuilder: (context, i) {
        final int dayNum = i - offsetInFirstWeek;
        if (dayNum < 1 || dayNum > daysInMonth) return const SizedBox.shrink();

        return WidgetDayCircle(
          day: dayNum,
          value: insights.intakeForDay(dayNum) ?? 0,
          goal: insights.hydrationTargetForDay(dayNum) ?? 0,
        );
      },
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Row(
          spacing: 6,
          children: [
            WidgetDayCircle(day: 0, value: 1, goal: 1),
            Text(
              S.current.goalMet,
              style: context.textTheme.labelSmall?.copyWith(color: WidgetDayCircle.fullColor(context)),
            ),
          ],
        ),
        Row(
          spacing: 6,
          children: [
            WidgetDayCircle(day: 0, value: 4, goal: 10),
            Text(
              S.current.partial,
              style: context.textTheme.labelSmall?.copyWith(color: WidgetDayCircle.emptyColor(context)),
            ),
          ],
        ),
      ],
    );
  }
}
