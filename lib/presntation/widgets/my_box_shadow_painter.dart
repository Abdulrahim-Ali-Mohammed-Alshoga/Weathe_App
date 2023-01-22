import 'package:flutter/material.dart';

class MyBoxShadowPainter extends CustomPainter {
   String good;
  Map<String, Color> colorShadow = {
    "01": const Color(0xffff8510),
    "02": const Color(0xffc5edfe),
    "03": const Color(0xff70afea),
    "04": const Color(0xff6db1f2),
    "09": const Color(0xff91bee0),
    "10": const Color(0xfff1d16a),
    "11": const Color(0xff7197b7),
    "13": const Color(0xff0c5bc0),
    "50": const Color(0xffbdbcba)
  };

  MyBoxShadowPainter(this.good);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    // here are my custom shapes
    path.lineTo(0, size.height - 170);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 170);
    path.lineTo(size.width, 0);

    path.close();

    canvas.drawShadow(path, colorShadow[good]!, 90.0, true);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
