import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/app_bar/hovered_section_title.dart';

class HoveredButtons extends StatelessWidget {
  const HoveredButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        direction: context.isDesktopSmallOrDesktop
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          HoveredSectionTitle(
            title: 'About',
            onTap: () {},
          ),
          HoveredSectionTitle(
            title: 'Skills',
            onTap: () {},
          ),
          HoveredSectionTitle(
            title: 'Projects',
            onTap: () {},
          ),
          HoveredSectionTitle(
            title: 'Contact',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
