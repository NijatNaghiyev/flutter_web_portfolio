// lib/core/cubits/base_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    AppLogger.error('Error in $runtimeType: $error');
  }

  Future<void> safeEmit(T state) async {
    if (!isClosed) {
      emit(state);
    }
  }
}
