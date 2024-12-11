import 'package:flutter/material.dart';

import '../presentation/sections/introduction_section.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

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
                child: IntroductionSection(isMobile: true)
              ),
            ),
          ),
        ],
      ),
    );
  }
}