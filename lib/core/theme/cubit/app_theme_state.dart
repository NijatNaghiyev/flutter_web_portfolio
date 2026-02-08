part of 'app_theme_cubit.dart';

@immutable
sealed class AppThemeState {
  const AppThemeState(this.themeMode);

  factory AppThemeState.fromJson(Map<String, dynamic> json) {
    final themeName = ThemeMode.values.firstWhere(
      (e) => e.name == json[keyName],
      orElse: () => ThemeMode.system,
    );

    return switch (themeName) {
      ThemeMode.light => const AppThemeLight(),
      ThemeMode.dark => const AppThemeDark(),
      ThemeMode.system => const AppThemeSystem(),
    };
  }

  static const keyName = 'themeName';

  final ThemeMode themeMode;

  Map<String, dynamic> toJson() {
    return {keyName: themeMode.name};
  }
}

final class AppThemeSystem extends AppThemeState {
  const AppThemeSystem() : super(ThemeMode.system);
}

final class AppThemeLight extends AppThemeState {
  const AppThemeLight() : super(ThemeMode.light);
}

final class AppThemeDark extends AppThemeState {
  const AppThemeDark() : super(ThemeMode.dark);
}

extension AppThemeStateX on AppThemeState {
  bool get isSystem => this is AppThemeSystem;
  bool get isLight => this is AppThemeLight;
  bool get isDark => this is AppThemeDark;
}
