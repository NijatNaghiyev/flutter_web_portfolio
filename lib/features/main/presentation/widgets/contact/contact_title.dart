import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class ContactTitle extends StatelessWidget {
  const ContactTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's Work Together",
          style: AppTextStyle.sectionTitle.copyWith(
            color: AppColors.getForeground(context),
          ),
        ),
        Text(
          "Have a project in mind? Looking for a Flutter expert to join your team? I'm currently available for freelance projects and full-time opportunities.",
          style: AppTextStyle.buttonText.copyWith(
            color: AppColors.getForeground(
              context,
            ).withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
