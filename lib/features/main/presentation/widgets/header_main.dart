import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/header_image.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header.dart';

class HeaderMain extends StatelessWidget {
  const HeaderMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 36),
      child: Row(
        spacing: 36,
        mainAxisAlignment: .spaceBetween,
        children: [
          const TitleHeader(),

          if (context.isDesktopSmallOrDesktop) const HeaderImage(),
        ],
      ),
    );
  }
}
