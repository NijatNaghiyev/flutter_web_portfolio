import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/router/app_router.dart';
import 'package:flutter_web_portfolio/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
