import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/data/datasources/main_ds.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepository)
class MainRepositoryImpl implements MainRepository {
  MainRepositoryImpl(this._mainDs);
  final MainDs _mainDs;

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      final res = await _mainDs.getProfile();
      return Success(res.toEntity());
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<String>> getCvDownloadPath(String path) async {
    try {
      final res = await _mainDs.getCvDownloadPath(path);

      return Success(res);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<List<SkillsEntity>>> getSkills() async {
    try {
      final res = await _mainDs.getSkills();
      return Success(res.toEntity());
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
