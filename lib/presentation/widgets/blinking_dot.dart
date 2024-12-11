import 'package:flutter/material.dart';

class BlinkingDot extends StatefulWidget {
  final Color color;
  const BlinkingDot({super.key, required this.color});

  @override
  BlinkingDotState createState() => BlinkingDotState();
}

class BlinkingDotState extends State<BlinkingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    // Función recursiva para manejar el ciclo de animación
    void animate() async {
      if (!mounted) return;
      
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(const Duration(seconds: 3));
      
      if (mounted) animate();
    }

    // Iniciar el ciclo
    animate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WavePainter(
        animation: _controller,
        color: widget.color,
      ),
      child: Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _WavePainter({required this.animation, required this.color}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final double progress = animation.value;
    final double maxRadius = size.width * 0.7;
    final double radius = maxRadius * progress;

    final paint = Paint()
      ..color = color.withOpacity(0.5 * (1 - progress)) // Opacidad
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8; // Grosor

    // Dibujar la onda principal
    canvas.drawCircle(size.center(Offset.zero), radius, paint);

    // Dibujar una segunda onda para mayor efecto
    final double secondaryProgress = (progress - 0.3).clamp(0.0, 1.0);
    final double secondaryRadius = maxRadius * secondaryProgress;

    if (secondaryProgress > 0) {
      final paintSecondary = Paint()
        ..color = color.withOpacity(0.3 * (1 - secondaryProgress))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      canvas.drawCircle(size.center(Offset.zero), secondaryRadius, paintSecondary);
    }
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) => true;
}