import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/data/datasources/main_ds.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/repositories/main_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MainRepository)
class MainRepositoryImpl implements MainRepository {
  final MainDs _mainDs;
  MainRepositoryImpl(this._mainDs);

  @override
  Future<Result<ProfileEntity>> getProfile() async {
    try {
      final res =await  _mainDs.getProfile();
      return Success(res.toEntity());
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
