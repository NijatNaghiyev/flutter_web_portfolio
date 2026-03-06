import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/const/app_assets.dart';
import 'package:flutter_web_portfolio/core/services/scroll_service.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/core/theme/app_textstyle.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_state.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/contact/contact_body.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/contact/contact_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: getIt<ScrollService>().contactKey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: const Column(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactTitle(),
          ContactBody(),
        ],
      ),
    );
  }
}
