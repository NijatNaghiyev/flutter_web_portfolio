import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class MyProjectsTitle extends StatelessWidget {
  const MyProjectsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: .start,
      children: [
        Text(
          'My Projects',
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
