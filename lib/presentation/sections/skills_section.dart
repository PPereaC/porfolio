import 'package:flutter/material.dart';

import '../../config/data/technologies_data.dart';
import '../widgets/widgets.dart';

class SkillsSection extends StatelessWidget {
  final bool isMobile;

  const SkillsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final height = MediaQuery.of(context).size.height;

    final itemSize = isMobile 
        ? (screenWidth * 0.9) / 2 
        : (screenWidth * 0.9) / 4;

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          const minWidth = 600.0;
          const maxWidth = 1200.0;
  
          double factor;
          if (screenWidth < minWidth) {
            factor = 0.9;
          } else {
            factor = 0.6 + ((screenWidth - minWidth) / (maxWidth - minWidth)) * 0.3;
            factor = factor.clamp(0.2, 0.5);
          }

          return Column(
            children: [
              SizedBox(
                width: screenWidth * factor,
                child: Text(
                  'Mis Skills',
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: isMobile ? height * 0.01 : height * 0.01),
              
              SizedBox(
                width: screenWidth * factor,
                child: Text(
                  isMobile
                    ? 'Pulsa sobre una tecnología para ver más detalles'
                    : 'Haz clic sobre una tecnología para ver más detalles',
                  style: textTheme.bodyLarge!.copyWith(
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: screenWidth * factor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 2 : 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: technologies.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: itemSize,
                      width: itemSize,
                      child: TechnologyCard(
                        technology: technologies[index],
                        textStyle: textTheme.bodyLarge,
                        isMobile: isMobile,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}