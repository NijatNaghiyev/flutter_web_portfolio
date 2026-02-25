import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

/// Main service for Firebase Cloud Firestore operations
@lazySingleton
class FirestoreService {
  FirestoreService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get a single document by ID
  Future<Map<String, dynamic>?> getDocument({
    required String collection,
    required String docId,
  }) async {
    try {
      final doc = await _firestore.collection(collection).doc(docId).get();

      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e, s) {
      AppLogger.error(
        'Error getting document from $collection: $e',
        stackTrace: s,
      );
      rethrow;
    }
  }
}
