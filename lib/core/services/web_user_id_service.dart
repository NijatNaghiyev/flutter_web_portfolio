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
    final storage = window.localStorage;

    final existingId = storage.getItem(_storageKey);
    if (existingId != null) {
      return existingId;
    }

    final newId = _uuid.v4();
    storage.setItem(_storageKey, newId);
    return newId;
  }
}
