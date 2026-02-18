import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/core/const/app_assets.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/widgets/icon_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header/download_cv_button.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header/view_my_work.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              "👋 Hello, I'm a Flutter Developer",
              style: AppTextStyle.bodyLarge.copyWith(color: AppColors.primary),
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
              color: AppColors.getForeground(context).withValues(alpha: 0.7),
            ),
          ),

          const SizedBox(
            height: 36,
          ),
          const Row(
            spacing: 16,
            children: [
              ViewMyWork(),
              DownloadCvButton(),
            ],
          ),

          const SizedBox(
            height: 36,
          ),

          Row(
            spacing: 16,
            children: [
              IcButton(icon: AppAssets.githubIcon, onTap: () {}),
              IcButton(icon: AppAssets.linkedinIcon, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
