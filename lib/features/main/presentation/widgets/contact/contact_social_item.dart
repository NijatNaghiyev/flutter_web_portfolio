import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/utils/url_helper.dart';

class ContactSocialItem extends StatefulWidget {
  const ContactSocialItem({required this.title, this.link, super.key});

  final String? link;
  final String title;

  @override
  State<ContactSocialItem> createState() => _ContactSocialItemState();
}

class _ContactSocialItemState extends State<ContactSocialItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.link == null) return const SizedBox.shrink();

    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          getIt<UrlHelper>().openUrl(widget.link!);
        },
        child: Text(
          widget.title,
          style: AppTextStyle.bodyBase.copyWith(
            color: isHovered
                ? AppColors.primary
                : AppColors.getForeground(
                    context,
                  ).withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
