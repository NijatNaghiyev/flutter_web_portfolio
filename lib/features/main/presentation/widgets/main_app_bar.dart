import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60.0,
      pinned: true,
      scrolledUnderElevation: 100,
      toolbarHeight: 50,
      backgroundColor: Colors.white.withValues(alpha: 0.8),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '</> FlutterDev',
              style: TextStyle(
                color: Color(0xff2094F3),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        background: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
