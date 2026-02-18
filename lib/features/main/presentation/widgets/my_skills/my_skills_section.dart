import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_skills/my_skill_title.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_skills/my_skills_list.dart';

class MySkillsSection extends StatelessWidget {
  const MySkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Flex(
        direction: context.isMobileOrTablet ? Axis.vertical : Axis.horizontal,
        children: const [
          MySkillTitle(),
          MySkillsList(),
        ],
      ),
    );
  }
}
