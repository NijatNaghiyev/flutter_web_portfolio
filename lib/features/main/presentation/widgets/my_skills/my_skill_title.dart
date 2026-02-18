import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_skills/work_with_me_button.dart';

class MySkillTitle extends StatelessWidget {
  const MySkillTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final percent = context.isMobileOrTablet ? 1 : 0.35;
    return SizedBox(
      width: width * percent,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 36,
        children: [
          Text(
            'My Skills',
            style: AppTextStyle.sectionTitle.copyWith(
              color: AppColors.getForeground(context),
            ),
          ),
          Text(
            'A comprehensive toolkit that enables me to build robust and beautiful applications from concept to deployment.',
            style: AppTextStyle.buttonText.copyWith(
              color: AppColors.getForeground(
                context,
              ).withValues(alpha: 0.7),
            ),
          ),
          const WorkWithMeButton(),
        ],
      ),
    );
  }
}
