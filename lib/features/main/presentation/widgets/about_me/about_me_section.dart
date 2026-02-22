import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/about_me/about_me_title.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  static const String aboutMeText = '''
I am a Flutter mobile developer with more than 3 years of professional experience in building high-quality, user-centric mobile applications. Alongside Flutter, I’m also a SwiftUI enthusiast, exploring how Apple’s modern UI framework can complement my mobile development skills.

I have a strong passion for writing clean, maintainable code and thrive in collaborative, cross-functional environments. I continuously seek to grow both technically and professionally, and I’m particularly interested in projects that challenge me to push the boundaries of what Flutter can do. If you’re looking for a dedicated developer to bring value to your team or product—let’s connect!
''';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: getIt<ScrollService>().aboutKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
      color: AppColors.getMuted(context).withValues(alpha: 0.7),
      child: Column(
        spacing: 28,
        children: [
          const AboutMeTitle(),
          Text(
            aboutMeText,
            style: AppTextStyle.smallMuted.copyWith(
              color: AppColors.getForeground(context).withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
