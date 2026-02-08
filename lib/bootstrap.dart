import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/config/firebase_options.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Bootstrap function to initialize the app
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup error handling
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kDebugMode) {
      log('Flutter Error: ${details.exception}');
    }
    // Log to Crashlytics
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  };

  // Catch async errors
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kDebugMode) {
      log('Async Error: $error');
    }
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  // Setup Bloc observer for debugging
  Bloc.observer = AppBlocObserver();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory.web,
  );

  // Configure dependency injection
  configureDependencies();

  if (kDebugMode) {
    log('✅ Bootstrap completed successfully');
  }

  // Run the app
  runApp(await builder());
}

/// Bloc observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log('🟢 ${bloc.runtimeType} created');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log('🔵 ${bloc.runtimeType} changed: $change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      log('🔴 ${bloc.runtimeType} error: $error');
    }
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log('🔴 ${bloc.runtimeType} closed');
    }
  }
}
