import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:web/web.dart';

@singleton
/// Service class for managing unique web user identification
class WebUserId {
  static const _storageKey = 'web_user_id';
  static const _uuid = Uuid();

  /// Gets or creates a unique user ID stored in local storage
  String get() {
    final newId = _uuid.v4();

    try {
      final storage = window.localStorage;

      final existingId = storage.getItem(_storageKey);
      if (existingId != null) {
        return existingId;
      }

      storage.setItem(_storageKey, newId);
      return newId;
    } catch (e, s) {
      AppLogger.error(
        'Error accessing local storage for WebUserId: $e',
        stackTrace: s,
      );

      return newId;
    }
  }
}
