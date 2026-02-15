import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/howered_buttons.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/lets_talk_button.dart';

class MainAppBarDrawer extends StatelessWidget {
  const MainAppBarDrawer({
    required this.height,
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, bool>(
      builder: (context, state) {
        return TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 0,
            end: context.isMobileOrTablet && state ? 1 : 0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          builder: (context, value, _) {
            return Container(
              height: 270 * value,
              width: double.infinity,
              color: AppColors.getBackground(
                context,
              ).withValues(alpha: 0.7),
              child: Visibility(
                visible: context.isMobileOrTablet && state && value == 1,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Column(
                    spacing: 24,
                    crossAxisAlignment: .start,
                    children: [
                      HoveredButtons(),
                      LetsTalkButton(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
