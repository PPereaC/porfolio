import 'package:flutter/material.dart';

import '../presentation/sections/introduction_section.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillViewport(
          delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IntroductionSection(isMobile: false),
            ),
            // Próximas secciones
          ]),
        ),
      ],
    );
  }
}