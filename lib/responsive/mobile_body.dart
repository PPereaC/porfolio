import 'package:flutter/material.dart';
import '../presentation/sections/introduction_section.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IntroductionSection(isMobile: true),
            ),
          ),
        ),
        // Próximas secciones
      ],
    );
  }
}