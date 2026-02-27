import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/config/firebase_options.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/cubits/app_bloc_observer.dart';
import 'package:flutter_web_portfolio/core/services/analytics_service.dart';
import 'package:flutter_web_portfolio/core/services/app_check_service.dart';
import 'package:flutter_web_portfolio/core/services/authentication_service.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Bootstrap function to initialize the app
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Bloc observer for debugging
  Bloc.observer = AppBlocObserver();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory.web,
  );

  // Configure dependency injection
  configureDependencies();

  await getIt<AppCheckService>().initialize();

  await getIt<AnalyticsService>().setUserId();

  await getIt<AuthenticationService>().signInAnonymously();

  AppLogger.success('Bootstrap completed successfully');

  // Run the app
  await runZonedGuarded(
    () async {
      runApp(await builder());
    },
    zoneValues: {
      #myKey: 'myValue',
    },
    (error, stack) => AppLogger.error(
      'Uncaught error in runZonedGuarded: $error',
      stackTrace: stack,
    ),
  );
}
