import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/data/tags_data.dart';
import '../../domain/entities/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isMobile;

  const ProjectCard({super.key, required this.project, required this.isMobile});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final tags = widget.project.tagLabels.map((label) {
      final tag = allTags.firstWhere((tag) => tag.name == label);
      return tag;
    }).toList();

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.project.repositoryUrl))) {
            await launchUrl(Uri.parse(widget.project.repositoryUrl));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered ? (Matrix4.identity()..scale(1.02)) : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.8),
              width: 2,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: colors.secondary.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
          ),
          width: widget.isMobile ? screenWidth * 0.9 : screenWidth * 0.25,
          height: widget.isMobile ? screenHeight * 0.6 : screenHeight * 0.45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.8,
                  child: Image.asset(
                    widget.project.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: widget.isMobile ? screenHeight * 0.2 : screenHeight * 0.3,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black87.withOpacity(0.6),
                    child: Padding(
                      padding: widget.isMobile ? const EdgeInsets.all(12) : const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.title,
                            style: textTheme.titleMedium,
                          ),
                          SizedBox(height: widget.isMobile ? 0 : 8),
                          Flexible(
                            child: Text(
                              widget.project.description,
                              style: widget.isMobile 
                                ? textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey[400],
                                )
                                : textTheme.bodyLarge!.copyWith(
                                  color: Colors.grey[400],
                                ),
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          const Spacer(),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: tags.map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: colors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: colors.primary.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    tag.imageUrl,
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    tag.title,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}