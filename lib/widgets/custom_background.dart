import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../constants/colors.dart';

class CustomBackground extends CustomPainter {
  final bool orangeToBottom;

  CustomBackground({this.orangeToBottom = false});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint paint = Paint();

    // Draw blue path at the last
    Path bluePath = Path();
    Paint bluePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(width * 0.6, height * 0.8),
        Offset(width * 0.6, 0.0),
        [
          MyColors.darkBlueColor,
          MyColors.skyColor,
        ],
      );

    bluePath.moveTo(width * 0.8, 0.0);
    bluePath.lineTo(width, 0.0);
    bluePath.quadraticBezierTo(width, height * 0.3, width, height);
    bluePath.lineTo(0.0, height);
    bluePath.lineTo(0.0, 0.0);
    bluePath.close();
    paint.color = MyColors.skyColor;
    canvas.drawPath(bluePath, bluePaint);

    // Draw yello path in the middle
    Path yellowPath = Path();
    yellowPath.moveTo(width * 0.75, 0.0);
    yellowPath.quadraticBezierTo(
        width * 0.75, height * 0.3, width * 0.25, height);
    yellowPath.lineTo(0.0, height);
    yellowPath.lineTo(0.0, 0.0);
    yellowPath.close();
    paint.color = MyColors.yellowColor;
    canvas.drawPath(yellowPath, paint);

    // Draw orange path on the top
    Paint orangePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0.0, 0.0),
        Offset(width * 0.3, height),
        [
          Color(0xFFf57f17),
          Color(0xFFff6f00),
          Color(0xFFf4511e),
        ],
        [
          0.1,
          0.4,
          0.85,
        ],
      );

    Path orangePath = Path();
    orangeToBottom ? orangePath.moveTo(0.0, 50.0) : orangePath.moveTo(50, 0.0);
    orangePath.quadraticBezierTo(
        width * 0.65, height * 0.15, width * 0.7, height);
    orangePath.lineTo(0.0, height);
    orangePath.lineTo(0.0, 0.0);
    orangePath.close();

    canvas.drawPath(orangePath, orangePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
