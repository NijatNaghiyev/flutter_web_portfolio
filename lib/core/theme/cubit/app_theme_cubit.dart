import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

@lazySingleton
class AppThemeCubit extends HydratedCubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeSystem());

  @override
  AppThemeState? fromJson(Map<String, dynamic> json) {
    try {
      return AppThemeState.fromJson(json);
    } catch (_) {
      return const AppThemeSystem();
    }
  }

  @override
  Map<String, dynamic>? toJson(AppThemeState state) {
    try {
      return state.toJson();
    } catch (_) {
      return const AppThemeSystem().toJson();
    }
  }

  void setTheme(ThemeMode themeMode) => emit(switch (themeMode) {
    ThemeMode.light => const AppThemeLight(),
    ThemeMode.dark => const AppThemeDark(),
    ThemeMode.system => const AppThemeSystem(),
  });
}
