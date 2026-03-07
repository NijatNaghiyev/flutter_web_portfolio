import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';

void main() {
  group('DrawerCubit', () {
    late DrawerCubit drawerCubit;

    setUp(() {
      drawerCubit = DrawerCubit();
    });

    tearDown(() {
      drawerCubit.close();
    });

    test('initial state is false (drawer closed)', () {
      expect(drawerCubit.state, false);
    });

    blocTest<DrawerCubit, bool>(
      'toggle changes state from false to true',
      build: () => DrawerCubit(),
      act: (cubit) => cubit.toggle(),
      expect: () => [true],
    );

    blocTest<DrawerCubit, bool>(
      'toggle changes state from true to false',
      build: () => DrawerCubit(),
      seed: () => true,
      act: (cubit) => cubit.toggle(),
      expect: () => [false],
    );

    blocTest<DrawerCubit, bool>(
      'toggle multiple times alternates state',
      build: () => DrawerCubit(),
      act: (cubit) {
        cubit.toggle();
        cubit.toggle();
        cubit.toggle();
      },
      expect: () => [true, false, true],
    );

    blocTest<DrawerCubit, bool>(
      'closeDrawer sets state to false from true',
      build: () => DrawerCubit(),
      seed: () => true,
      act: (cubit) => cubit.closeDrawer(),
      expect: () => [false],
    );

    blocTest<DrawerCubit, bool>(
      'closeDrawer keeps state false if already false',
      build: () => DrawerCubit(),
      act: (cubit) => cubit.closeDrawer(),
      expect: () => [false],
    );
  });
}
