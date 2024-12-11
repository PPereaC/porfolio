import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'blinking_dot.dart';

class JobNotification extends StatelessWidget {
  const JobNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return FadeInRight(
      duration: const Duration(milliseconds: 800),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colors.primary,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BlinkingDot(color: Colors.green),
            const SizedBox(width: 8),
            Text(
              'Disponible para trabajar',
              style: textTheme.bodyMedium
            ),
          ],
        ),
      ),
    );
  }
}