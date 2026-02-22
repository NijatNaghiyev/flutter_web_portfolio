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
import '../../core/services/scroll_service.dart' as _i963;
import '../../core/services/web_user_id_service.dart' as _i749;
import '../../core/theme/cubit/app_theme_cubit.dart' as _i986;
import '../../features/main/presentation/cubits/drawer/drawer_cubit.dart'
    as _i386;

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
    gh.lazySingleton<_i986.AppThemeCubit>(() => _i986.AppThemeCubit());
    gh.singleton<_i977.AnalyticsService>(
      () => _i977.AnalyticsService(gh<_i749.WebUserId>()),
    );
    return this;
  }
}
