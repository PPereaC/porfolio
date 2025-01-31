import 'package:flutter/material.dart';

import '../presentation/sections/sections.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: IntroductionSection(isMobile: false),
            ),
            SizedBox(height: height * 0.1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ProjectsSection(isMobile: false),
            ),
            SizedBox(height: height * 0.2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: JobsSection(isMobile: false),
            ),
            SizedBox(height: height * 0.2),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SkillsSection(isMobile: false),
            ),
            const SizedBox(height: 200),
          ]),
        ),
      ],
    );
  }
}