import 'package:flutter/material.dart';

import '../presentation/sections/introduction_section.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: AspectRatio(
                aspectRatio: 16 / 2,
                child: IntroductionSection()
              ),
            ),
          ),
        ],
      ),
    );
  }
}