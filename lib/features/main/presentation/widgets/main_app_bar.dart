import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/theme/app_theme.dart';
import 'package:flutter_web_portfolio/core/theme/cubit/app_theme_cubit.dart';
import 'package:web/web.dart' as web;

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      pinned: true,
      scrolledUnderElevation: 100,
      toolbarHeight: 50,
      backgroundColor: Colors.white.withValues(alpha: 0.8),
      elevation: 12,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () => web.window.location.reload(),
              child: Text(
                '</> FlutterDev',
                style: TextStyle(
                  color: Color(0xff2094F3),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const Spacer(),

            _themeModeButton(),
          ],
        ),
        background: Container(
          color: Colors.white,
        ),
      ),
    );
  }

  BlocBuilder<AppThemeCubit, AppThemeState> _themeModeButton() {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      bloc: getIt<AppThemeCubit>(),
      builder: (context, state) {
        return PopupMenuButton(
          tooltip: 'Change Theme',
          icon: Icon(
            state.themeMode == ThemeMode.light
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            color: Colors.black,
          ),
          itemBuilder: (context) => ThemeMode.values
              .map(
                (mode) => PopupMenuItem(
                  value: mode,
                  onTap: () {
                    getIt<AppThemeCubit>().setTheme(
                      mode,
                    );
                  },
                  child: Text(mode.name.toUpperCase()),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
