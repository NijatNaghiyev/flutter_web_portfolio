import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class HoveredSectionTitle extends StatefulWidget {
  const HoveredSectionTitle({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  State<HoveredSectionTitle> createState() => _HoveredSectionTitleState();
}

class _HoveredSectionTitleState extends State<HoveredSectionTitle> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Text(
            widget.title,
            style: AppTextStyle.bodyBase.copyWith(
              color: isHovered ? AppColors.primary : null,
            ),
          ),
        ),
      ),
    );
  }
}
