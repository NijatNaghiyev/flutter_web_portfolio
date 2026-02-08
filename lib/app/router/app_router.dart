import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/router/app_routes.dart';
import 'package:flutter_web_portfolio/features/error/error_screen.dart';
import 'package:flutter_web_portfolio/features/main/presentation/main_screen.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: AppRoutes.main.path,
        name: AppRoutes.main.name,
        builder: (context, state) => const MainScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}
