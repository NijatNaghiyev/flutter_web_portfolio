import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/core/utils/app_logger.dart';
import 'package:flutter_web_portfolio/core/utils/url_helper.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/cv_download/cv_download_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/cv_download/cv_download_state.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCvButton extends StatelessWidget {
  const DownloadCvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CvDownloadCubit, CvDownloadState>(
      listener: (context, state) {
        if (state.status == CvDownloadStatus.success &&
            state.cvDownloadPath != null) {
          launchCv(state.cvDownloadPath!);
        }
      },
      child: InkWell(
        onTap: () => onTap(context),
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
      ),
    );
  }

  Future<void> onTap(BuildContext context) async {
    final cvPath = context.read<MainCubit>().state.profile?.cvPath;
    if (cvPath == null) {
      AppLogger.warning('CV path is null');
      return;
    }

    await context.read<CvDownloadCubit>().downloadCv(cvPath);
  }

  Future<void> launchCv(String cvDownloadPath) async {
    getIt<UrlHelper>().downloadFile(cvDownloadPath);
  }
}
