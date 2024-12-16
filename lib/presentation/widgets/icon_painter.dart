import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

Path parseSvgPath(String svgPath) {
  return parseSvgPathData(svgPath);
}

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
    try {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.fill
        ..isAntiAlias = true;

      // Parsear viewBox
      final List<String> viewBoxValues = viewBox.split(' ');
      final viewBoxWidth = double.parse(viewBoxValues[2]);
      final viewBoxHeight = double.parse(viewBoxValues[3]);

      // Calcular escala manteniendo aspect ratio
      final scale = (size.width / viewBoxWidth)
          .clamp(0.0, size.height / viewBoxHeight);

      // Centrar el SVG
      final dx = (size.width - (viewBoxWidth * scale)) / 2;
      final dy = (size.height - (viewBoxHeight * scale)) / 2;

      canvas.save();
      
      // Aplicar transformaciones
      canvas.translate(dx, dy);
      canvas.scale(scale, scale);

      // Dibujar path
      canvas.drawPath(path, paint);

      canvas.restore();
    } catch (e) {
      // Fallback: dibujar un rectángulo si hay error
      final paint = Paint()
        ..color = color.withOpacity(0.5)
        ..style = PaintingStyle.fill;
      
      canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        paint
      );
    }
  }

  @override
  bool shouldRepaint(IconPainter oldDelegate) {
    return oldDelegate.color != color || 
           oldDelegate.path != path ||
           oldDelegate.viewBox != viewBox;
  }
}