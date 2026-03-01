import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

/// Bloc observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    AppLogger.info('🟢 ${bloc.runtimeType} created');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppLogger.info('🔵 ${bloc.runtimeType} changed: $change');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppLogger.error('🔴 ${bloc.runtimeType} error: $error');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    AppLogger.info('🔴 ${bloc.runtimeType} closed');
  }
}