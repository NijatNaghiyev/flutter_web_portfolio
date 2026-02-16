import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class ViewMyWork extends StatefulWidget {
  const ViewMyWork({super.key});

  @override
  State<ViewMyWork> createState() => _ViewMyWorkState();
}

class _ViewMyWorkState extends State<ViewMyWork> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: isHovered ? 1.08 : 1.0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
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
            'View My Work',
            style: AppTextStyle.bodyBase.copyWith(
              color: AppColors.lightMuted,
            ),
          ),
        ),
      ),
    );
  }
}
