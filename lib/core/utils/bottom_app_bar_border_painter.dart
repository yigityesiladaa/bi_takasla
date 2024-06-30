import 'package:bitakasla/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class BottomAppBarBorderPainter extends CustomPainter {
  final double notchMargin;
  final Color borderColor;
  final double borderWidth;

  BottomAppBarBorderPainter({
    required this.notchMargin,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Left side
    path.moveTo(0, borderWidth / 2);
    path.lineTo(size.width / 2 - notchMargin - 32.h, borderWidth / 2);

    // Notch
    final notchRadius = notchMargin + 32.h;
    final notchRect = Rect.fromCircle(
      center: Offset(size.width / 2, borderWidth / 2),
      radius: notchRadius,
    );
    path.arcTo(notchRect, 3.14159, -3.14159, false);

    // Right side
    path.lineTo(size.width, borderWidth / 2);

    // Draw the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
