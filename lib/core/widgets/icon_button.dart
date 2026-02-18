import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';

class IcButton extends StatefulWidget {
  const IcButton({required this.icon, required this.onTap, super.key});
  final String icon;
  final VoidCallback onTap;

  @override
  State<IcButton> createState() => _IcButtonState();
}

class _IcButtonState extends State<IcButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (hovering) {
        setState(() {
          isHovered = hovering;
        });
      },
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          widget.icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            isHovered ? AppColors.primary : AppColors.getForeground(context),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
