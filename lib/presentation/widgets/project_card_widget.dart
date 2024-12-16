import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/data/tags_data.dart';
import '../../domain/entities/project.dart';


class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    super.key, 
    required this.project
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    final tags = widget.project.tagLabels.map((label) {
      final tag = allTags.firstWhere((tag) => tag.name == label);
      return tag;
    }).toList();

    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(widget.project.repositoryUrl)),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox( 
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12), 
                      topRight: Radius.circular(12)
                    ),
                    child: Image.asset(
                      widget.project.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.project.description,
                        style: textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[400],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: tags.map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            tag.imageUrl,
                            height: 16,
                            width: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            tag.title,
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    )).toList(),
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