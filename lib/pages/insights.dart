import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydra_buddy/extensions/context.dart';

import '../UI/utils.dart';
import '../generated/l10n.dart';
import '../widgets/app_bar.dart';
import '../widgets/insights/month.dart';
import '../widgets/insights/today.dart';
import '../widgets/insights/week/view.dart';
import '../widgets/nav_bar.dart';

class PageInsights extends ConsumerStatefulWidget {
  static const double summaryCardHeight = 150;
  static const double _tabBarHeight = 56;

  const PageInsights({super.key});

  @override
  ConsumerState<PageInsights> createState() => _PageInsightsState();
}

class _PageInsightsState extends ConsumerState<PageInsights> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: WidgetNavBar(),
      appBar: WidgetAppBar(titleText: S.current.insights),
      body: Padding(
        padding:
            MediaQuery.of(context).padding +
            const EdgeInsets.only(top: WidgetAppBar.height, bottom: WidgetNavBar.height) +
            EdgeInsets.only(top: 12),
        child: Stack(
          children: [
            Positioned.fill(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: PageInsights._tabBarHeight + 12, bottom: 12, left: 16, right: 16),
                    child: WidgetInsightsToday(),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: PageInsights._tabBarHeight + 12,
                      bottom: 12,
                      left: 16,
                      right: 16,
                    ),
                    child: WidgetInsightsWeek(),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: PageInsights._tabBarHeight + 12,
                      bottom: 12,
                      left: 16,
                      right: 16,
                    ),
                    child: WidgetInsightsMonth(),
                  ),
                ],
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, height: PageInsights._tabBarHeight, child: _buildTabBar(context)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.colorScheme.surface, boxShadow: UIUtils.shadow),
      child: TabBar(
        controller: _tabController,
        labelColor: context.colorScheme.primary,
        unselectedLabelColor: Colors.grey[600],
        indicatorColor: context.colorScheme.primary,
        indicatorWeight: 3,
        padding: EdgeInsets.symmetric(horizontal: 20),
        tabs: _Period.values.map((e) => Tab(text: e.l10n)).toList(),
      ),
    );
  }
}

enum _Period {
  today,
  byWeek,
  byMonth;

  String get l10n {
    return switch (this) {
      _Period.today => S.current.today,
      _Period.byWeek => S.current.week,
      _Period.byMonth => S.current.month,
    };
  }
}
