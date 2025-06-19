import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../UI/utils.dart';
import '../../extensions/color_scheme.dart';
import '../../extensions/context.dart';
import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../models/weather.dart';
import '../../providers/current_user.dart';
import '../../providers/unit.dart';
import '../../providers/weather.dart';
import '../../widgets/error.dart';
import '../async.dart';

class DayOverview extends StatelessWidget {
  const DayOverview({super.key});

  @override
  Widget build(BuildContext context) {
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
          _buildGreeting(),
          const SizedBox(height: 10),
          WidgetAsync(
            provider: currentUserProvider,
            loadingBuilder: _buildLoading,
            builder: (context, ref, User? userData) {
              if (userData == null) {
                // userData == null is considered an error since when user == null, onboarding should be triggered
                return WidgetError(S.current.couldNotLoadUserData);
              }

              return WidgetAsync(
                provider: weatherProvider,
                loadingBuilder: _buildLoading,
                errorBuilder: (context, e, s) {
                  return WidgetError(S.current.couldNotLoadUserData);
                },
                builder: (context, ref, Weather? weatherData) {
                  if (weatherData == null) {
                    return WidgetError(S.current.failedToLoadWeatherData);
                  }

                  return _buildContent(weatherData, context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Weather weatherData, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWeatherData(weatherData, context),
        const SizedBox(height: 8),
        _buildIntakeAdvice(weatherData, context),
      ],
    );
  }

  Widget _buildGreeting() {
    return WidgetAsync(
      provider: currentUserProvider,
      builder: (context, ref, data) {
        return Text(
          S.current.welcomeX(data?.name ?? ''),
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.primary,
          ),
        );
      },
    );
  }

  Widget _buildIntakeAdvice(Weather weatherData, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.info_outline, color: context.colorScheme.primary, size: 18),
          Expanded(child: Text(weatherData.getHydrationAdvice().description, style: context.textTheme.bodyMedium)),
          Consumer(
            builder: (context, ref, child) {
              return Text(
                ref
                    .watch(volumetricUnitProvider)
                    .formatValue(weatherData.getHydrationAdvice().hydrationEffect, isExtraText: true),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        CircularProgressIndicator(strokeWidth: 2),
        Expanded(child: Text(S.current.loadingWeatherData, style: context.textTheme.bodyMedium)),
      ],
    );
  }

  Widget _buildWeatherData(Weather weatherData, BuildContext context) {
    return Row(
      children: [
        Icon(Icons.thermostat, color: context.colorScheme.primary, size: 22),
        const SizedBox(width: 6),
        Consumer(
          builder: (context, ref, child) {
            return Text(
              ref.watch(temperatureUnitProvider).formatValue(weatherData.temperature),
              style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            );
          },
        ),
        const SizedBox(width: 16),
        Icon(Icons.water_drop, color: context.colorScheme.primary, size: 22),
        const SizedBox(width: 6),
        Text(
          '${weatherData.humidity.toStringAsFixed(0)}%',
          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
