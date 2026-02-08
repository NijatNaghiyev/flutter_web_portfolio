// lib/core/cubits/base_cubit.dart
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<T> {
  BaseCubit(super.initialState);

  // Override to handle errors
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      log(
        'Error in $runtimeType: $error',
        stackTrace: stackTrace,
        name: 'BaseCubit',
      );
    }
  }
}
