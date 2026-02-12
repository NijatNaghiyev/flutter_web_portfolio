import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/config/firebase_options.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
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

  if (kDebugMode) {
    log('✅ Bootstrap completed successfully');
  }

  // Run the app
  runApp(await builder());
}

/// Bloc observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log('🟢 ${bloc.runtimeType} created');
    }
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log('🔵 ${bloc.runtimeType} changed: $change');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      log('🔴 ${bloc.runtimeType} error: $error');
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log('🔴 ${bloc.runtimeType} closed');
    }
  }
}
