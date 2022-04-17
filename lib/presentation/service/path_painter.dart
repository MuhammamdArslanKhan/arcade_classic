import 'package:flutter/material.dart';

class PathPainter extends CustomPainter {

  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
   Paint paint = Paint()
     ..color = Colors.redAccent.withOpacity(0)
     ..style = PaintingStyle.stroke
     ..strokeWidth = 23.0;

   canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}