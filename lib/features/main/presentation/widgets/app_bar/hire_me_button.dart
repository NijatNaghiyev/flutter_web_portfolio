import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/services/analytics_service.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class HireMeButton extends StatelessWidget {
  const HireMeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unawaited(
          getIt<AnalyticsService>().logEvent(
            name: 'main_hire_me_click',
            parameters: {'button_text': 'Hire Me'},
          ),
        );
        getIt<ScrollService>().scrollToKey(
          key: getIt<ScrollService>().contactKey,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.5),
              blurRadius: 16,
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
      ),
    );
  }
}
