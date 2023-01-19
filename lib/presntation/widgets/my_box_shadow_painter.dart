import 'package:flutter/material.dart';

class MyBoxShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height-170);
    path.quadraticBezierTo(
        size.width/2 , size.height , size.width, size.height- 170);
    path.lineTo(size.width, 0);

    path.close();

    canvas.drawShadow(path, Color(0xff86bdf2), 90.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }}