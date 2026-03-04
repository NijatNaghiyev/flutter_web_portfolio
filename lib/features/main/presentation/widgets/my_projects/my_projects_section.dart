import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_projects/my_projects_list.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_projects/my_projects_title.dart';

class MyProjectsSection extends StatelessWidget {
  const MyProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: getIt<ScrollService>().projectsKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      color: AppColors.getMuted(context).withValues(alpha: 0.7),
      child: const Column(
        spacing: 16,
        crossAxisAlignment: .stretch,
        children: [
          MyProjectsTitle(),
          MyProjectsList(),
        ],
      ),
    );
  }
}
