import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

@lazySingleton
class UrlHelper {
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      AppLogger.warning(
        'Could not launch $uri',
        stackTrace: StackTrace.current,
      );
    }
  }

  void downloadFile(String url, {String? fileName}) {
    try {
      web.window.location.href = url;
    } catch (e, s) {
      AppLogger.error('Error downloading file from $url: $e', stackTrace: s);
    }
  }
}
