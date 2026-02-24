// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/services/analytics_service.dart' as _i977;
import '../../core/services/firestore_service.dart' as _i307;
import '../../core/services/scroll_service.dart' as _i963;
import '../../core/services/storage_service.dart' as _i54;
import '../../core/services/web_user_id_service.dart' as _i749;
import '../../core/theme/cubit/app_theme_cubit.dart' as _i986;
import '../../core/utils/url_helper.dart' as _i336;
import '../../features/main/data/datasources/main_ds.dart' as _i354;
import '../../features/main/data/repositories/main_repository_impl.dart'
    as _i411;
import '../../features/main/domain/repositories/main_repository.dart' as _i298;
import '../../features/main/domain/usecases/main_usecase.dart' as _i47;
import '../../features/main/presentation/cubits/cv_download/cv_download_cubit.dart'
    as _i1004;
import '../../features/main/presentation/cubits/drawer/drawer_cubit.dart'
    as _i386;
import '../../features/main/presentation/cubits/main/main_cubit.dart' as _i809;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i386.DrawerCubit>(() => _i386.DrawerCubit());
    gh.singleton<_i963.ScrollService>(() => _i963.ScrollService());
    gh.singleton<_i749.WebUserId>(() => _i749.WebUserId());
    gh.lazySingleton<_i307.FirestoreService>(() => _i307.FirestoreService());
    gh.lazySingleton<_i54.StorageService>(() => _i54.StorageService());
    gh.lazySingleton<_i986.AppThemeCubit>(() => _i986.AppThemeCubit());
    gh.lazySingleton<_i336.UrlHelper>(() => _i336.UrlHelper());
    gh.factory<_i354.MainDs>(
      () =>
          _i354.MainDs(gh<_i307.FirestoreService>(), gh<_i54.StorageService>()),
    );
    gh.singleton<_i977.AnalyticsService>(
      () => _i977.AnalyticsService(gh<_i749.WebUserId>()),
    );
    gh.factory<_i298.MainRepository>(
      () => _i411.MainRepositoryImpl(gh<_i354.MainDs>()),
    );
    gh.factory<_i47.MainUsecase>(
      () => _i47.MainUsecase(gh<_i298.MainRepository>()),
    );
    gh.factory<_i1004.CvDownloadCubit>(
      () => _i1004.CvDownloadCubit(gh<_i47.MainUsecase>()),
    );
    gh.factory<_i809.MainCubit>(() => _i809.MainCubit(gh<_i47.MainUsecase>()));
    return this;
  }
}
