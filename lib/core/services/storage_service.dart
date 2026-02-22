import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

/// Main service for Firebase Storage operations
@lazySingleton
class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  StorageService();

  /// Get download URL for a file
  Future<String?> getDownloadUrl({required String path}) async {
    try {
      final ref = _storage.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      AppLogger.error('Error getting download URL for $path: $e');
      rethrow;
    }
  }

  /// Download file data
  Future<Uint8List?> downloadData({
    required String path,
    int? maxSize,
  }) async {
    try {
      final ref = _storage.ref().child(path);
      final data = await ref.getData(
        maxSize ?? 10 * 1024 * 1024,
      ); // Default 10MB

      AppLogger.success('File downloaded successfully from $path');
      return data;
    } catch (e) {
      AppLogger.error('Error downloading file from $path: $e');
      rethrow;
    }
  }
}
