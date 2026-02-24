import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/services/analytics_service.dart';

/// Logger utility that only logs in debug mode
class AppLogger {
  /// Log an error message
  static void error(String message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      dev.log('❌ $message', stackTrace: stackTrace);
    } else {
      getIt<AnalyticsService>().logEvent(
        name: 'error',
        parameters: {'message': message, 'stackTrace': stackTrace.toString()},
      );
    }
  }

  /// Log a success message
  static void success(String message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      dev.log('✅ $message', stackTrace: stackTrace);
    } else {
      getIt<AnalyticsService>().logEvent(
        name: 'success',
        parameters: {'message': message, 'stackTrace': stackTrace.toString()},
      );
    }
  }

  /// Log an info message
  static void info(String message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      dev.log('ℹ️ $message', stackTrace: stackTrace);
    } else {
      getIt<AnalyticsService>().logEvent(
        name: 'info',
        parameters: {'message': message, 'stackTrace': stackTrace.toString()},
      );
    }
  }

  /// Log a warning message
  static void warning(String message, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      dev.log('⚠️ $message', stackTrace: stackTrace);
    } else {
      getIt<AnalyticsService>().logEvent(
        name: 'warning',
        parameters: {'message': message, 'stackTrace': stackTrace.toString()},
      );
    }
  }
}
