import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainUsecase {
  final MainRepository _mainRepository;

  MainUsecase(this._mainRepository);

  Future<Result<ProfileEntity>> getProfile() {
    return _mainRepository.getProfile();
  }
}
