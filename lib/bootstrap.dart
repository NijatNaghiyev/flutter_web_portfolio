import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/config/firebase_options.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
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

  AppLogger.success('Bootstrap completed successfully');

  await getIt<AnalyticsService>().setUserId();

  await getIt<AuthenticationService>().signInAnonymously();

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

/// Bloc observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    AppLogger.info('🟢 ${bloc.runtimeType} created');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.info('🔵 ${bloc.runtimeType} changed: $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('🔴 ${bloc.runtimeType} error: $error');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    AppLogger.info('🔴 ${bloc.runtimeType} closed');
  }
}
