import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home.dart';
import '../pages/insights.dart';
import '../models/user.dart';
import '../pages/onboarding/onboarding.dart';
import '../providers/current_user.dart';
import '../pages/settings.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return SafeArea(child: Center(child: Text('Error Page')));
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) {
          if (state.fullPath == '/') {
            final User? currentUser = ref.read(currentUserProvider).valueOrNull;
            if (currentUser == null || currentUser.isOnboardingCompleted != true) {
              return OnboardingPage.getStarted.fullPath;
            } else {
              return '/home';
            }
          }

          return null;
        },
        routes: [
          GoRoute(
            path: 'onboarding',
            name: 'onboarding',
            pageBuilder: (context, state) {
              return CupertinoPage(child: PageOnboardingGetStarted());
            },
            routes: [
              GoRoute(
                path: 'name',
                name: 'name',
                pageBuilder: (context, state) {
                  return CupertinoPage(child: PageOnboardingNameInput());
                },
              ),
              GoRoute(
                path: 'personal-info',
                name: 'personal-info',
                pageBuilder: (context, state) {
                  return CupertinoPage(child: const PageOnboardingPersonalInfo());
                },
              ),
              GoRoute(
                path: 'physical-activity',
                name: 'physical-activity',
                pageBuilder: (context, state) {
                  return CupertinoPage(child: const PageOnboardingPhysicalActivity());
                },
              ),
              GoRoute(
                path: 'location',
                name: 'location',
                pageBuilder: (context, state) {
                  return CupertinoPage(child: const PageOnboardingLocation());
                },
              ),
              GoRoute(
                path: 'ready',
                name: 'ready',
                pageBuilder: (context, state) {
                  return CupertinoPage(child: const PageOnboardingReady());
                },
              ),
            ],
          ),
          GoRoute(
            path: 'home',
            name: 'home',
            redirect: (context, state) {
              final User? currentUser = ref.read(currentUserProvider).value;
              if (currentUser == null) {
                return OnboardingPage.getStarted.fullPath;
              }
              return null;
            },
            pageBuilder: (context, state) {
              return CupertinoPage(child: PageHome());
            },
          ),
          GoRoute(
            path: 'insights',
            name: 'insights',
            redirect: (context, state) {
              final User? currentUser = ref.read(currentUserProvider).value;
              if (currentUser == null) {
                return OnboardingPage.getStarted.fullPath;
              }
              return null;
            },
            pageBuilder: (context, state) {
              return CupertinoPage(child: const PageInsights());
            },
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            redirect: (context, state) {
              final User? currentUser = ref.read(currentUserProvider).value;
              if (currentUser == null) {
                return OnboardingPage.getStarted.fullPath;
              }
              return null;
            },
            pageBuilder: (context, state) {
              return CupertinoPage(child: const PageSettings());
            },
          ),
        ],
      ),
    ],
  );
}
