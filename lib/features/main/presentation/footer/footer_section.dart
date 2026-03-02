import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/const/app_strings.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      color: AppColors.getMuted(context).withValues(alpha: 0.7),
      child: Column(
        spacing: 24,
        children: [
          Text(
            AppStrings.title,
            style: AppTextStyle.projectTitle.copyWith(
              color: AppColors.primary,
            ),
          ),
          Text(
            '© 2026 FlutterDev Portfolio. Built with Flutter Love.',
            style: AppTextStyle.bodyBase.copyWith(
              color: AppColors.getForeground(context),
            ),
          ),
        ],
      ),
    );
  }
}
