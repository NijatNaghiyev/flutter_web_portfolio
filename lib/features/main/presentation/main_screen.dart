import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_portfolio/app/di/injection.dart';
import 'package:flutter_web_portfolio/core/extensions/context.dart';
import 'package:flutter_web_portfolio/features/main/presentation/cubits/drawer/drawer_cubit.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/main_app_bar.dart';

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
  Widget build(BuildContext context) {
    return BlocProvider<DrawerCubit>(
      create: (context) => getIt<DrawerCubit>(),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              _buildHeaderSliver,
          body: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
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
