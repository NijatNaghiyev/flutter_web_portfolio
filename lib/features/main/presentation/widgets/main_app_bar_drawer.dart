import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/howered_buttons.dart';

class MainAppBarDrawer extends StatelessWidget {
  const MainAppBarDrawer({
    super.key,
  });

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
              height: 300 * value,
              width: double.infinity,
              color: Colors.teal,
              child: Visibility(
                visible: context.isMobileOrTablet && state && value == 1,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    HoveredButtons(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
