import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';

class IcButton extends StatelessWidget {
  const IcButton({required this.icon, required this.onTap, super.key});
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            AppColors.getForeground(context),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
