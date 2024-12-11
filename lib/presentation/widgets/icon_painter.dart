// Painter personalizado para los iconos SVG
import 'package:flutter/material.dart';

class IconPainter extends CustomPainter {
  final Color color;
  final Path path;
  final String viewBox;

  IconPainter({
    required this.color,
    required this.path,
    required this.viewBox,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final List<String> viewBoxValues = viewBox.split(' ');
    final viewBoxWidth = double.parse(viewBoxValues[2]);
    final viewBoxHeight = double.parse(viewBoxValues[3]);

    final scaleX = size.width / viewBoxWidth;
    final scaleY = size.height / viewBoxHeight;
    
    canvas.scale(scaleX, scaleY);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}