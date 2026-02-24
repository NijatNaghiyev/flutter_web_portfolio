import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/app/router/app_router.dart';
import 'package:flutter_web_portfolio/core/theme/app_theme.dart';
import 'package:flutter_web_portfolio/core/theme/cubit/app_theme_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DrawerCubit>(
          create: (context) => getIt<DrawerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MainCubit>(),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        bloc: getIt<AppThemeCubit>(),
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: AppRouter.router,
            themeMode: themeState.themeMode,
          );
        },
      ),
    );
  }
}
