import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/const/app_assets.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:flutter_web_portfolio/core/utils/url_helper.dart';
import 'package:flutter_web_portfolio/core/widgets/icon_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/cv_download/cv_download_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header/download_cv_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header/view_my_work.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 800),
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(AlwaysStoppedAnimation(value)),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "👋 Hello, I'm Nijat Naghiyev",
                style: AppTextStyle.bodyLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Building Beautiful',
              style: AppTextStyle.sectionTitle.copyWith(fontSize: 58),
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [AppColors.primary, Color(0xFF1EB2A5)],
                stops: [0.0, .8],
              ).createShader(bounds),
              child: Text(
                'Cross-Platform Experiences',
                style: AppTextStyle.sectionTitle.copyWith(
                  fontSize: 58,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            Text(
              "I specialize in creating high-performance, cross-platform applications using Flutter and Dart. Let's turn your ideas into reality.",
              style: AppTextStyle.bodyBase.copyWith(
                color: AppColors.getForeground(
                  context,
                ).withValues(alpha: 0.7),
              ),
            ),

            const SizedBox(
              height: 36,
            ),
            Row(
              spacing: 16,
              children: [
                const ViewMyWork(),
                BlocProvider(
                  create: (context) => getIt<CvDownloadCubit>(),
                  child: const DownloadCvButton(),
                ),
              ],
            ),

            const SizedBox(
              height: 36,
            ),

            Row(
              spacing: 16,
              children: [
                IcButton(
                  icon: AppAssets.githubIcon,
                  onTap: () => openUrl(
                    context.read<MainCubit>().state.profile?.github,
                  ),
                ),
                IcButton(
                  icon: AppAssets.linkedinIcon,
                  onTap: () => openUrl(
                    context.read<MainCubit>().state.profile?.linkedin,
                  ),
                ),
                IcButton(
                  icon: AppAssets.mailIcon,
                  onTap: () => openMail(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openUrl(String? url) {
    if (url == null) {
      AppLogger.warning('URL is null', stackTrace: StackTrace.current);
      return;
    }
    getIt<UrlHelper>().openUrl(url);
  }

  void openMail(BuildContext context) {
    if (context.read<MainCubit>().state.profile?.email == null) {
      AppLogger.warning('Email is null', stackTrace: StackTrace.current);
      return;
    }

    getIt<UrlHelper>().openMail(
      context.read<MainCubit>().state.profile!.email!,
    );
  }
}
