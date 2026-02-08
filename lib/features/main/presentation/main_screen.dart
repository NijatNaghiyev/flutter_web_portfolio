import 'package:flutter/material.dart';
import 'package:flutter_web_portfolio/features/main/presentation/widgets/main_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const MainAppBar(),
        ],

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
    );
  }
}
