import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_web_portfolio/core/services/web_user_id_service.dart';
import 'package:injectable/injectable.dart';

@singleton
/// Service class for handling Firebase Analytics operations
class AnalyticsService {

  const AnalyticsService(this._webUserId);
  final WebUserId _webUserId;

  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// Set the user ID for analytics tracking
  Future<void> setUserId() async {
    final id = _webUserId.get();
    await _analytics.setUserId(id: id);
  }

  /// Log a custom event
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  /// Log screen view
  Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) async {
    await _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }

  /// Set user property
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) async {
    await _analytics.setUserProperty(
      name: name,
      value: value,
    );
  }

  /// Get the Firebase Analytics instance
  FirebaseAnalytics get instance => _analytics;
}
