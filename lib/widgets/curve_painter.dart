import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvePainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  CurvePainter(this.primaryColor, this.secondaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    var paint = Paint();

    paint.shader = ui.Gradient.linear(
      Offset(200, 200),
      Offset(0,0),
      [
        primaryColor,
        secondaryColor,
      ],);
    paint.style = PaintingStyle.fill; // Change this to fill
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}