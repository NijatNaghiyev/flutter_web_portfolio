import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/extensions/string.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/theme/cubit/app_theme_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/hire_me_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/howered_buttons.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/main_app_bar_drawer.dart';
import 'package:web/web.dart' as web;

class MainAppBar extends StatefulWidget {
  const MainAppBar({
    super.key,
  });

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  static const _title = '</> FlutterDev';
  static const double _drawerHeight = 270;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, bool>(
      builder: (context, state) {
        return TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: context.isMobileOrTablet && state ? 1 : 0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          builder: (context, value, _) {
            final extraHeight = context.isMobileOrTablet
                ? _drawerHeight * value
                : 0.0;

            return SliverAppBar(
              automaticallyImplyActions: false,
              expandedHeight: 60 + extraHeight,
              pinned: true,
              scrolledUnderElevation: 100,
              toolbarHeight: 50 + extraHeight,
              backgroundColor: AppColors.getBackground(
                context,
              ),
              elevation: 12,
              flexibleSpace: Column(
                mainAxisAlignment: .end,
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: FlexibleSpaceBar(
                        expandedTitleScale: 1.1,
                        centerTitle: false,
                        titlePadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        title: Row(
                          crossAxisAlignment: .end,
                          children: [
                            _buildProjectTitle(),

                            const Spacer(),

                            ?_buildSectionTitles(context),

                            _themeModeButton(),

                            ?_buildCornerButton(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (context.isMobileOrTablet && (value > 0 || state))
                    const MainAppBarDrawer(
                      height: _drawerHeight,
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget? _buildCornerButton(BuildContext context) {
    if (context.isDesktopSmallOrDesktop) {
      return const Padding(
        padding: EdgeInsets.only(left: 16, bottom: 4),
        child: HireMeButton(),
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.dehaze_rounded),
        onPressed: () {
          HapticFeedback.lightImpact();

          context.read<DrawerCubit>().toggle();
        },
      );
    }
  }

  InkWell _buildProjectTitle() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        web.window.location.reload();
      },
      child: Text(
        _title,
        style: AppTextStyle.projectTitle.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget? _buildSectionTitles(BuildContext context) {
    if (context.isDesktopSmallOrDesktop) {
      return const HoveredButtons();
    }

    return null;
  }

  BlocBuilder<AppThemeCubit, AppThemeState> _themeModeButton() {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      bloc: getIt<AppThemeCubit>(),
      builder: (context, state) {
        return PopupMenuButton(
          tooltip: 'Change Theme',
          enableFeedback: true,
          iconSize: 20,
          padding: EdgeInsets.zero,
          icon: Icon(
            state.themeMode == ThemeMode.light
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
            color: AppColors.getForeground(context),
          ),
          itemBuilder: (context) => ThemeMode.values
              .map(
                (mode) => PopupMenuItem(
                  value: mode,
                  onTap: () {
                    HapticFeedback.lightImpact();

                    getIt<AppThemeCubit>().setTheme(
                      mode,
                    );
                  },
                  child: Text(
                    mode.name.firstLetterUpperCase,
                    style: AppTextStyle.bodyBase,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
