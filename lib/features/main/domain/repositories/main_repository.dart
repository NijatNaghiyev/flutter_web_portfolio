import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';

abstract class MainRepository {
  Future<Result<ProfileEntity>> getProfile();
  Future<Result<String>> getCvDownloadPath(String path);
}
