import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

/// Logger utility that only logs in debug mode
class AppLogger {
  /// Log an error message
  static void error(String message) {
    if (kDebugMode) {
      dev.log('❌ $message');
    }
  }

  /// Log a success message
  static void success(String message) {
    if (kDebugMode) {
      dev.log('✅ $message');
    }
  }

  /// Log an info message
  static void info(String message) {
    if (kDebugMode) {
      dev.log('ℹ️ $message');
    }
  }

  /// Log a warning message
  static void warning(String message) {
    if (kDebugMode) {
      dev.log('⚠️ $message');
    }
  }
}
