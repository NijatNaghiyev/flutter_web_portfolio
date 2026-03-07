import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/core/theme/cubit/app_theme_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  group('AppThemeCubit', () {
    late Storage storage;

    setUp(() {
      storage = MockStorage();
      when(
        () => storage.write(any(), any<dynamic>()),
      ).thenAnswer((_) async {});
      when(() => storage.read(any())).thenReturn(null);
      when(() => storage.delete(any())).thenAnswer((_) async {});
      when(() => storage.close()).thenAnswer((_) async {});
      when(() => storage.clear()).thenAnswer((_) async {});
      HydratedBloc.storage = storage;
    });

    test('initial state is AppThemeSystem', () {
      final themeCubit = AppThemeCubit();
      expect(themeCubit.state, isA<AppThemeSystem>());
      expect(themeCubit.state.themeMode, ThemeMode.system);
      themeCubit.close();
    });

    group('setTheme', () {
      blocTest<AppThemeCubit, AppThemeState>(
        'emits AppThemeLight when ThemeMode.light is set',
        build: () => AppThemeCubit(),
        act: (cubit) => cubit.setTheme(ThemeMode.light),
        expect: () => [isA<AppThemeLight>()],
        verify: (cubit) {
          expect(cubit.state.themeMode, ThemeMode.light);
          expect(cubit.state.isLight, true);
          expect(cubit.state.isDark, false);
          expect(cubit.state.isSystem, false);
        },
      );

      blocTest<AppThemeCubit, AppThemeState>(
        'emits AppThemeDark when ThemeMode.dark is set',
        build: () => AppThemeCubit(),
        act: (cubit) => cubit.setTheme(ThemeMode.dark),
        expect: () => [isA<AppThemeDark>()],
        verify: (cubit) {
          expect(cubit.state.themeMode, ThemeMode.dark);
          expect(cubit.state.isDark, true);
          expect(cubit.state.isLight, false);
          expect(cubit.state.isSystem, false);
        },
      );

      blocTest<AppThemeCubit, AppThemeState>(
        'emits AppThemeSystem when ThemeMode.system is set',
        build: () => AppThemeCubit(),
        act: (cubit) => cubit.setTheme(ThemeMode.system),
        expect: () => [isA<AppThemeSystem>()],
        verify: (cubit) {
          expect(cubit.state.themeMode, ThemeMode.system);
          expect(cubit.state.isSystem, true);
          expect(cubit.state.isLight, false);
          expect(cubit.state.isDark, false);
        },
      );

      blocTest<AppThemeCubit, AppThemeState>(
        'switches between different themes correctly',
        build: () => AppThemeCubit(),
        act: (cubit) {
          cubit.setTheme(ThemeMode.light);
          cubit.setTheme(ThemeMode.dark);
          cubit.setTheme(ThemeMode.system);
        },
        expect: () => [
          isA<AppThemeLight>(),
          isA<AppThemeDark>(),
          isA<AppThemeSystem>(),
        ],
      );
    });

    group('JSON serialization', () {
      test('toJson returns correct map for light theme', () {
        // Arrange
        const state = AppThemeLight();

        // Act
        final json = state.toJson();

        // Assert
        expect(json, {'themeName': 'light'});
      });

      test('toJson returns correct map for dark theme', () {
        // Arrange
        const state = AppThemeDark();

        // Act
        final json = state.toJson();

        // Assert
        expect(json, {'themeName': 'dark'});
      });

      test('toJson returns correct map for system theme', () {
        // Arrange
        const state = AppThemeSystem();

        // Act
        final json = state.toJson();

        // Assert
        expect(json, {'themeName': 'system'});
      });

      test('fromJson creates AppThemeLight from map', () {
        // Arrange
        final json = {'themeName': 'light'};

        // Act
        final state = AppThemeState.fromJson(json);

        // Assert
        expect(state, isA<AppThemeLight>());
        expect(state.themeMode, ThemeMode.light);
      });

      test('fromJson creates AppThemeDark from map', () {
        // Arrange
        final json = {'themeName': 'dark'};

        // Act
        final state = AppThemeState.fromJson(json);

        // Assert
        expect(state, isA<AppThemeDark>());
        expect(state.themeMode, ThemeMode.dark);
      });

      test('fromJson creates AppThemeSystem from map', () {
        // Arrange
        final json = {'themeName': 'system'};

        // Act
        final state = AppThemeState.fromJson(json);

        // Assert
        expect(state, isA<AppThemeSystem>());
        expect(state.themeMode, ThemeMode.system);
      });

      test('fromJson defaults to AppThemeSystem for invalid value', () {
        // Arrange
        final json = {'themeName': 'invalid'};

        // Act
        final state = AppThemeState.fromJson(json);

        // Assert
        expect(state, isA<AppThemeSystem>());
        expect(state.themeMode, ThemeMode.system);
      });
    });

    group('AppThemeState extensions', () {
      test('isLight returns true only for AppThemeLight', () {
        expect(const AppThemeLight().isLight, true);
        expect(const AppThemeDark().isLight, false);
        expect(const AppThemeSystem().isLight, false);
      });

      test('isDark returns true only for AppThemeDark', () {
        expect(const AppThemeDark().isDark, true);
        expect(const AppThemeLight().isDark, false);
        expect(const AppThemeSystem().isDark, false);
      });

      test('isSystem returns true only for AppThemeSystem', () {
        expect(const AppThemeSystem().isSystem, true);
        expect(const AppThemeLight().isSystem, false);
        expect(const AppThemeDark().isSystem, false);
      });
    });
  });
}
