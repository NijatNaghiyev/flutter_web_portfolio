import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
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
            onTap: () {
              getIt<ScrollService>().scrollToKey(
                key: getIt<ScrollService>().aboutKey,
                isFromDrawer: true,
              );
            },
          ),
          HoveredSectionTitle(
            title: 'Skills',
            onTap: () {
              getIt<ScrollService>().scrollToKey(
                key: getIt<ScrollService>().skillsKey,
                isFromDrawer: true,
              );
            },
          ),
          HoveredSectionTitle(
            title: 'Projects',
            onTap: () {
              getIt<ScrollService>().scrollToKey(
                key: getIt<ScrollService>().skillsKey,
                isFromDrawer: true,
              );
            },
          ),
          HoveredSectionTitle(
            title: 'Contact',
            onTap: () {
              getIt<ScrollService>().scrollToKey(
                key: getIt<ScrollService>().skillsKey,
                isFromDrawer: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
