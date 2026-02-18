import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';

class WorkWithMeButton extends StatefulWidget {
  const WorkWithMeButton({super.key});

  @override
  State<WorkWithMeButton> createState() => _WorkWithMeButtonState();
}

class _WorkWithMeButtonState extends State<WorkWithMeButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: TextButton(
        onPressed: () {
          print('Work with me');
        },
        onHover: (hovering) {
          setState(() {
            isHovered = hovering;
          });
        },
        child: Row(
          spacing: 12,
          children: [
            Text(
              'Work with me',
              style: AppTextStyle.buttonText.copyWith(
                color: AppColors.primary,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: isHovered ? 8 : 0),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.primary,
                    size: 18,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
