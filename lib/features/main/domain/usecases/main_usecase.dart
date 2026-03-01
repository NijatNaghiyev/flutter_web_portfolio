import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainUsecase {
  MainUsecase(this._mainRepository);
  final MainRepository _mainRepository;

  Future<Result<ProfileEntity>> getProfile() {
    return _mainRepository.getProfile();
  }

  Future<Result<String>> getCvDownloadPath(String path) {
    return _mainRepository.getCvDownloadPath(path);
  }

  Future<Result<List<SkillsEntity>>> getSkills() {
    return _mainRepository.getSkills();
  }
}
