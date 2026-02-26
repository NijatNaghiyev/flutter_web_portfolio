import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class AboutMeTitle extends StatelessWidget {
  const AboutMeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Text(
          'About Me',
          style: AppTextStyle.sectionTitle.copyWith(
            color: AppColors.getForeground(context),
          ),
        ),

        Container(
          width: 150,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ],
    );
  }
}
