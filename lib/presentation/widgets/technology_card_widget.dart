import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../domain/entities/technology_item.dart';

class TechnologyCard extends StatefulWidget {
  final TechnologyItem technology;
  final TextStyle? textStyle;

  const TechnologyCard({
    super.key,
    required this.technology,
    this.textStyle,
  });

  @override
  State<TechnologyCard> createState() => _TechnologyCardState();
}

class _TechnologyCardState extends State<TechnologyCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: SvgPicture.asset(
              widget.technology.imagePath,
              placeholderBuilder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              semanticsLabel: widget.technology.name,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            widget.technology.name,
            style: widget.textStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          if (isHovered)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildExperienceStars(colors),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceStars(ColorScheme colors) {
    final levelIndex = widget.technology.level.index;
    final totalLevels = TechnologyLevel.values.length - 1;

    return List<Widget>.generate(totalLevels + 1, (index) {
      return Icon(
        index <= levelIndex ? Icons.star : Icons.star_border,
        color: colors.secondary,
        size: 20,
      );
    });
  }
}