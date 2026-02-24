import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MySkillsItem extends StatefulWidget {
  @Preview(
    name: 'MySkillsItem',
  )
  const MySkillsItem({super.key});

  @override
  State<MySkillsItem> createState() => _MySkillsItemState();
}

class _MySkillsItemState extends State<MySkillsItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1 - value,
          child: AnimatedScale(
            scale: 1 - 0.8 * value,
            duration: const Duration(milliseconds: 300),
            child: child,
          ),
        );
      },
      child: MouseRegion(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(0, isHovered ? -4 : 0, 0),
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: AppColors.getCard(context).withValues(alpha: .7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHovered ? AppColors.primary : AppColors.lightBorder,
              ),
              boxShadow: isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        blurRadius: 40,
                        spreadRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.05),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            foregroundDecoration: isHovered
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withValues(alpha: 0.1),
                        Colors.white.withValues(alpha: 0),
                      ],
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
