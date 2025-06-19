import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydra_buddy/models/goal.dart';
import 'package:hydra_buddy/models/intake_volume.dart';

import 'app.dart';
import 'models/intake.dart';
import 'models/registry.dart';
import 'models/user.dart';
import 'providers/current_user.dart';
import 'providers/goal.dart';
import 'providers/intake_volumes.dart';
import 'providers/progress.dart';
import 'providers/theme.dart';
import 'storage.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Storage.instance.init();

  await registerRepositories();
  final container = ProviderContainer();
  await preloadProviders(container);

  FlutterNativeSplash.remove();

  runApp(UncontrolledProviderScope(container: container, child: const App()));
}

Future<void> preloadProviders(ProviderContainer container) async {
  await container.read(themeNotifierProvider.future);
  await container.read(currentUserProvider.future);
  await container.read(intakeVolumesProvider.future);
  await container.read(waterIntakeGoalForTodayProvider.future);
  await container.read(progressForTodayProvider.future);
}

Future<void> registerRepositories() async {
  await Registry().registerRepository(RepositoryIntakeVolumes(Storage.instance.database));
  await Registry().registerRepository(RepositoryIntakes(Storage.instance.database));
  await Registry().registerRepository(RepositoryGoal(Storage.instance.database));
  await Registry().registerRepository(RepositoryUser(Storage.instance.database));
}
