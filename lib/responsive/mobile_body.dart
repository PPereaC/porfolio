import 'package:flutter/material.dart';

import '../presentation/sections/sections.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        // Sección de introducción
        const SliverToBoxAdapter(
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IntroductionSection(isMobile: true),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.05),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ProjectsSection(isMobile: true),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.05),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: JobsSection(isMobile: true),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.05),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SkillsSection(isMobile: true),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 28),
        ),
      ],
    );
  }
}