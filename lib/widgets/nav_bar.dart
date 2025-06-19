import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../UI/utils.dart';
import '../extensions/color_scheme.dart';
import '../extensions/context.dart';
import '../generated/l10n.dart';

class WidgetNavBar extends StatelessWidget {
  static const double height = 100;

  const WidgetNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final _Page currentPage = _Page.values.firstWhere((element) => element.route == location, orElse: () => _Page.home);

    return Container(
      height: height + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, -8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 40,
            offset: const Offset(0, -12),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: UIUtils.borderRadius24,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              gradient: context.colorScheme.primaryGradient,
              borderRadius: UIUtils.borderRadius24,
              border: Border(top: BorderSide(color: context.colorScheme.primary.withValues(alpha: 0.1), width: 1)),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: _buildNavItem(context: context, page: _Page.home, currentPage: currentPage),
                    ),
                    Expanded(
                      child: _buildNavItem(context: context, page: _Page.insights, currentPage: currentPage),
                    ),
                    Expanded(
                      child: _buildNavItem(context: context, page: _Page.settings, currentPage: currentPage),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required BuildContext context, required _Page page, required _Page currentPage}) {
    final isSelected = page == currentPage;

    return GestureDetector(
      key: ValueKey(page),
      onTap: () => context.go(page.route),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.15),
                    context.colorScheme.secondary.withValues(alpha: 0.08),
                  ],
                )
              : null,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: context.colorScheme.primary.withValues(alpha: 0.2), width: 1) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: isSelected
              ? BoxDecoration(color: context.colorScheme.primary.withValues(alpha: 0.1), shape: BoxShape.circle)
              : null,
          child: Icon(
            page.icon,
            color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
            size: isSelected ? 26 : 24,
          ),
        ),
      ),
    );
  }
}

enum _Page {
  home('/home', 0, Icons.home_rounded),
  insights('/insights', 1, Icons.analytics_rounded),
  settings('/settings', 2, Icons.settings_rounded);

  final String route;
  final int pageIndex;
  final IconData icon;

  const _Page(this.route, this.pageIndex, this.icon);

  String get title {
    return switch (this) {
      home => S.current.home,
      insights => S.current.insights,
      settings => S.current.settings,
    };
  }
}
