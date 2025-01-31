import 'package:flutter/material.dart';
import '../../config/data/projects_data.dart';
import '../widgets/widgets.dart';

class ProjectsSection extends StatelessWidget {

  final bool isMobile;

  const ProjectsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
                
          const minWidth = 600.0;
          const maxWidth = 1200.0;
  
          double factor;
          if (screenWidth < minWidth) {
            factor = 0.8;
          } else {
            // Calcular el factor de escala entre 0.4 y 0.8
            factor = 0.4 + ((screenWidth - minWidth) / (maxWidth - minWidth)) * 0.4;
            factor = factor.clamp(0.4, 0.8);
          }

          return Column(
            children: [
              SizedBox(
                width: screenWidth * factor,
                child: Text(
                  'Proyectos Destacados',
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: isMobile ? height * 0.01 : height * 0.01),
              
              SizedBox(
                width: screenWidth * factor,
                child: Text(
                  isMobile
                    ? 'Pulsa en un proyecto para ir al repositorio en GitHub'
                    : 'Haz clic en un proyecto para ir al repositorio en GitHub',
                  style: textTheme.bodyLarge!.copyWith(
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              SizedBox(height: isMobile ? height * 0.03 : height * 0.05),

              Padding(
                padding: isMobile ? const EdgeInsets.all(0) : const EdgeInsets.symmetric(horizontal: 130),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 3,
                    crossAxisSpacing: isMobile ? 25 : 40,
                    mainAxisSpacing: isMobile ? 25 : 0,
                  ),
                  children: projects.map((project) => ProjectCard(project: project, isMobile: isMobile)).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}