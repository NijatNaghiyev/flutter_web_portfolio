import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({super.key});

  @override
  State<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  static const _imagePath = 'assets/images/header_image.png';
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 48),
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedRotation(
            turns: isHovered ? 0 : 0.02,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: 400,
              height: 800,
              decoration: BoxDecoration(
                color: AppColors.getBackground(
                  context,
                ).withValues(alpha: 0.7),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Colors.white38,
                    width: 3,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(
                  _imagePath,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
