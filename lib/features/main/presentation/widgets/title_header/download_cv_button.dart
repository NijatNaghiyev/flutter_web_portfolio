import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:web/web.dart' as web;

class DownloadCvButton extends StatelessWidget {
  const DownloadCvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: AppColors.getMuted(context),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.getBorder(context),
            width: 2,
          ),
        ),
        child: Row(
          spacing: 8,
          children: [
            Text(
              'Download CV',
              style: AppTextStyle.bodyBase.copyWith(
                color: AppColors.getForeground(context),
              ),
            ),
            Icon(
              Icons.file_download_outlined,
              size: 24,
              color: AppColors.getForeground(context),
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    // Header
    //Content-Type: application/pdf
    //Content-Disposition: inline; filename="Nijat_CV.pdf"
    web.window.open(
      'https://api.yoursite.com/cv',
      '_blank',
    );
  }
}
