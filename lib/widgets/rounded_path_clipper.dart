import 'package:flutter/material.dart';

class RoundedPathClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.lineTo(0.0, height - 60);
    path.quadraticBezierTo(width * 0.8, height * 0.9, width, height * 0.15);
    path.lineTo(width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}