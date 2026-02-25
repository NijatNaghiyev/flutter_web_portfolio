import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_portfolio/core/services/analytics_service.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {
  AuthenticationService(this._analyticsService);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final AnalyticsService _analyticsService;

  Future<void> signInAnonymously() async {
    try {
      final user = await _firebaseAuth.signInAnonymously();

      await _analyticsService.setUserProperty(
        name: 'user_id',
        value: user.user?.uid ?? 'unknown',
      );

      AppLogger.info(
        'Signed in anonymously with UID: ${_firebaseAuth.currentUser?.uid}',
      );
    } on FirebaseAuthException catch (e, s) {
      AppLogger.error(
        'FirebaseAuthException during sign-in: ${e.code} - ${e.message}',
        stackTrace: s,
      );
    } catch (e, s) {
      AppLogger.error('Error signing in anonymously: $e', stackTrace: s);
    }
  }
}
