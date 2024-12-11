import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/utils/icons.dart';
import 'widgets.dart';

Path parseSvgPath(String svgPath) {
  return parseSvgPathData(svgPath);
}

class LinkButtons extends StatefulWidget {
  const LinkButtons({super.key});

  @override
  State<LinkButtons> createState() => LinkButtonsState();
}

class LinkButtonsState extends State<LinkButtons> {
  final Map<int, bool> _hoveredIcons = {};

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final icons = [AppIcons.github, AppIcons.linkedIn, AppIcons.email, AppIcons.cv];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: icons.asMap().entries.map((entry) {
        final index = entry.key;
        final icon = entry.value;
        final isHovered = _hoveredIcons[index] ?? false;

        Widget iconWidget = CustomPaint(
          size: const Size(24, 24),
          painter: IconPainter(
            color: colors.primary,
            path: parseSvgPath(icon.path),
            viewBox: icon.viewBox,
          ),
        );

        if (isHovered) {
          iconWidget = Bounce(
            from: 8,
            duration: const Duration(milliseconds: 200),
            child: iconWidget,
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onHover: (hovered) {
              setState(() {
                _hoveredIcons[index] = hovered;
              });
            },
            onTap: () => launchUrl(Uri.parse(icon.link)),
            hoverColor: Colors.transparent,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colors.primary.withOpacity(isHovered ? 0.4 : 0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: iconWidget,
            ),
          ),
        );
      }).toList(),
    );
  }
}