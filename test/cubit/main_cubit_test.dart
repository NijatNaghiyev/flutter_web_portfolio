import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/core/network/result.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/projects_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/skills_entity.dart';
import 'package:flutter_web_portfolio/features/main/domain/usecases/main_usecase.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:mocktail/mocktail.dart';

class MockMainUsecase extends Mock implements MainUsecase {}

void main() {
  group('MainCubit', () {
    late MainCubit mainCubit;
    late MockMainUsecase mockMainUsecase;

    setUp(() {
      mockMainUsecase = MockMainUsecase();
      mainCubit = MainCubit(mockMainUsecase);
    });

    tearDown(() {
      mainCubit.close();
    });

    test('initial state has null values', () {
      expect(mainCubit.state.profile, isNull);
      expect(mainCubit.state.skills, isNull);
      expect(mainCubit.state.projects, isNull);
    });

    group('getProfile', () {
      final testProfile = ProfileEntity(
        cvPath: 'path/to/cv.pdf',
        github: 'https://github.com/test',
        linkedin: 'https://linkedin.com/in/test',
        email: 'test@example.com',
        aboutMe: 'Test bio',
      );

      blocTest<MainCubit, MainState>(
        'emits state with profile on success',
        build: () {
          when(() => mockMainUsecase.getProfile()).thenAnswer(
            (_) async => Success(testProfile),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getProfile(),
        expect: () => [
          MainState(profile: testProfile),
        ],
        verify: (_) {
          verify(() => mockMainUsecase.getProfile()).called(1);
        },
      );

      blocTest<MainCubit, MainState>(
        'does not emit state on failure',
        build: () {
          when(() => mockMainUsecase.getProfile()).thenAnswer(
            (_) async => const Failure('Error loading profile'),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getProfile(),
        expect: () => [],
        verify: (_) {
          verify(() => mockMainUsecase.getProfile()).called(1);
        },
      );
    });

    group('getSkills', () {
      final testSkills = [
        SkillsEntity(title: 'Flutter', icon: null),
        SkillsEntity(title: 'Firebase', icon: null),
      ];

      blocTest<MainCubit, MainState>(
        'emits state with skills on success',
        build: () {
          when(() => mockMainUsecase.getSkills()).thenAnswer(
            (_) async => Success(testSkills),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getSkills(),
        expect: () => [
          MainState(skills: testSkills),
        ],
        verify: (_) {
          verify(() => mockMainUsecase.getSkills()).called(1);
        },
      );

      blocTest<MainCubit, MainState>(
        'does not emit state on failure',
        build: () {
          when(() => mockMainUsecase.getSkills()).thenAnswer(
            (_) async => const Failure('Error loading skills'),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getSkills(),
        expect: () => [],
        verify: (_) {
          verify(() => mockMainUsecase.getSkills()).called(1);
        },
      );
    });

    group('getProjects', () {
      final testProjects = [
        const ProjectsEntity(
          title: 'Project 1',
          description: 'Description 1',
          imageUrl: 'https://example.com/image1.jpg',
          githubUrl: 'https://github.com/test/project1',
          websiteUrl: 'https://project1.com',
          iosUrl: null,
          androidUrl: null,
          tags: 'Flutter, Firebase',
        ),
      ];

      blocTest<MainCubit, MainState>(
        'emits state with projects on success',
        build: () {
          when(() => mockMainUsecase.getProjects()).thenAnswer(
            (_) async => Success(testProjects),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getProjects(),
        expect: () => [
          MainState(projects: testProjects),
        ],
        verify: (_) {
          verify(() => mockMainUsecase.getProjects()).called(1);
        },
      );

      blocTest<MainCubit, MainState>(
        'does not emit state on failure',
        build: () {
          when(() => mockMainUsecase.getProjects()).thenAnswer(
            (_) async => const Failure('Error loading projects'),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.getProjects(),
        expect: () => [],
        verify: (_) {
          verify(() => mockMainUsecase.getProjects()).called(1);
        },
      );
    });

    group('init', () {
      blocTest<MainCubit, MainState>(
        'calls all three methods (getProfile, getSkills, getProjects)',
        build: () {
          when(() => mockMainUsecase.getProfile()).thenAnswer(
            (_) async => const Failure('Error loading profile'),
          );
          when(() => mockMainUsecase.getSkills()).thenAnswer(
            (_) async => const Failure('Error loading skills'),
          );
          when(() => mockMainUsecase.getProjects()).thenAnswer(
            (_) async => const Failure('Error loading projects'),
          );
          return MainCubit(mockMainUsecase);
        },
        act: (cubit) => cubit.init(),
        verify: (_) {
          verify(() => mockMainUsecase.getProfile()).called(1);
          verify(() => mockMainUsecase.getSkills()).called(1);
          verify(() => mockMainUsecase.getProjects()).called(1);
        },
      );
    });
  });
}
