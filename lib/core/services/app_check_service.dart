import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppCheckService {
  final FirebaseAppCheck _appCheck = FirebaseAppCheck.instance;

  static const _reCaptchaSiteKey = '6LfRu3csAAAAACj18M2WhksOan6dTh2bkF-q7U2a';

  Future<void> initialize() async {
    try {
      await _appCheck.activate(
        providerWeb: ReCaptchaV3Provider(_reCaptchaSiteKey),
      );

      AppLogger.info('Firebase App Check initialized successfully');
    } catch (e) {
      AppLogger.error('Error initializing Firebase App Check: $e');
    }
  }
}
