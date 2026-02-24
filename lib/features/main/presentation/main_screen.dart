import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/core/theme/app_colors.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/main/main_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/about_me/about_me_section.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/app_bar/main_app_bar.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/my_skills/my_skills_section.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/title_header/header_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> get _buildHeaderSliver {
    return const [
      MainAppBar(),
    ];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainCubit>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackground(
        context,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          overscroll: false,
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              _buildHeaderSliver,
          body: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              primary: true,
              child: Column(
                children: [
                  const HeaderMain(),
                  const AboutMeSection(),
                  const MySkillsSection(),
                  Container(
                    height: 300,
                    color: Colors.red,
                    child: const Center(
                      child: Text('Section 1'),
                    ),
                  ),
                  Text(MediaQuery.of(context).size.width.toString()),
                  Text(context.breakPoint.toString()),
                  Container(
                    height: 300,
                    color: Colors.red,
                    child: const Center(
                      child: Text('Section 1'),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Section 2'),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('Section 3'),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.red,
                    child: const Center(
                      child: Text('Section 1'),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Section 2'),
                    ),
                  ),
                  Container(
                    height: 300,
                    color: Colors.blue,
                    child: const Center(
                      child: Text('Section 3'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
