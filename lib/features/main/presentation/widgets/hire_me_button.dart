import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class HireMeButton extends StatelessWidget {
  const HireMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.lightBorder,
          width: 2,
        ),
      ),
      child: Text(
        'Hire Me',
        style: AppTextStyle.smallMuted.copyWith(
          color: AppColors.lightMuted,
        ),
      ),
    );
  }
}
