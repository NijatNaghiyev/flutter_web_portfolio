import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/about_me/about_me_title.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MainCubit, MainState, String?>(
      selector: (state) {
        return state.profile?.aboutMe;
      },
      builder: (context, state) {
        if (state == null) {
          return const SizedBox.shrink();
        }

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
                state,
                style: AppTextStyle.smallMuted.copyWith(
                  color: AppColors.getForeground(
                    context,
                  ).withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
