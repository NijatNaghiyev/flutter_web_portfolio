import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/core/const/app_assets.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/domain/entities/profile_entity.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/contact/contact_social_item.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Email
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppAssets.mailIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: Text(
            'Email',
            style: AppTextStyle.buttonText.copyWith(
              color: AppColors.getForeground(context),
            ),
          ),
          subtitle: BlocSelector<MainCubit, MainState, String?>(
            selector: (state) {
              return state.profile?.email;
            },
            builder: (context, state) {
              if (state == null) return const SizedBox.shrink();
              return Text(
                state,
                style: AppTextStyle.bodyBase.copyWith(
                  color: AppColors.getForeground(
                    context,
                  ).withValues(alpha: 0.7),
                ),
              );
            },
          ),
        ),

        // Socials
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              AppAssets.socialsIcon,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: Text(
            'Socials',
            style: AppTextStyle.buttonText.copyWith(
              color: AppColors.getForeground(context),
            ),
          ),
          subtitle: BlocSelector<MainCubit, MainState, ProfileEntity?>(
            selector: (state) {
              return state.profile;
            },
            builder: (context, state) {
              if (state == null) return const SizedBox.shrink();

              return Row(
                spacing: 12,
                children: [
                  ContactSocialItem(link: state.linkedin, title: 'LinkedIn'),
                  ContactSocialItem(link: state.github, title: 'GitHub'),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
