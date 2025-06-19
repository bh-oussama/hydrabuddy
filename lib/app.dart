import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydra_buddy/providers/theme.dart';
import 'package:hydra_buddy/widgets/async.dart';

import 'UI/dark_theme.dart';
import 'UI/light_theme.dart';
import 'generated/l10n.dart';
import 'router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return WidgetAsync(
      provider: themeNotifierProvider,
      builder: (context, ref, ThemeMode themeMode) {
        return MaterialApp.router(
          routerConfig: ref.watch(goRouterProvider),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
