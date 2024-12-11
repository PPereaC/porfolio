import 'package:flutter/material.dart';
import 'package:portfolio/presentation/sections/projects_section.dart';
import '../presentation/sections/introduction_section.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Sección de introducción
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IntroductionSection(isMobile: true),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ProjectsSection(isMobile: true),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
      ],
    );
  }
}