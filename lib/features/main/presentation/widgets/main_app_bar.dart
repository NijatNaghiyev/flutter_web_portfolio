import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/extensions/string.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/theme/cubit/app_theme_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/hire_me_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/hovered_section_title.dart';
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
      backgroundColor: AppColors.getBackground(context).withValues(alpha: 0.8),
      elevation: 12,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.2,
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 12),
        title: Row(
          children: [
            _buildProjectTitle(),

            const Spacer(),

            ?_buildSectionTitles(context),

            _themeModeButton(),

            ?_buildHireMeButton(context),
          ],
        ),
      ),
    );
  }

  Widget? _buildHireMeButton(BuildContext context) {
    if (context.isDesktop || context.isDesktopSmall) {
      return const Padding(
        padding: EdgeInsets.only(left: 16),
        child: HireMeButton(),
      );
    }

    return null;
  }

  InkWell _buildProjectTitle() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => web.window.location.reload(),
      child: Text(
        '</> FlutterDev',
        style: AppTextStyle.projectTitle.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget? _buildSectionTitles(BuildContext context) {
    if (context.isDesktop || context.isDesktopSmall) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          spacing: 16,
          children: [
            HoveredSectionTitle(title: 'About', onTap: () {}),
            HoveredSectionTitle(title: 'Skills', onTap: () {}),
            HoveredSectionTitle(title: 'Projects', onTap: () {}),
            HoveredSectionTitle(title: 'Contact', onTap: () {}),
          ],
        ),
      );
    }

    return null;
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
            color: AppColors.getForeground(context),
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
