import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../domain/entity/particle.dart';

class BubblePainter extends CustomPainter {
  int bubblesLimit = 20;
  final List<Particle> _points ;

  BubblePainter(this._points);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();

    Path secondPath = Path();
    secondPath.lineTo(size.width / 2, size.height / 2);
    path.addPath(secondPath, Offset(0, 220));
    path.addPath(secondPath, Offset(16, 16));
    canvas.drawPath(path, paint);
    //list of points
   /* var paint1 = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 30;
    canvas.drawPoints(PointMode.points, _points[0].offset, paint1);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

double random(min, max) {
  return (min + Random().nextInt(max - min)) as double;
}


void paint(Canvas canvas, Size size) {
  var center = size/2;
  var paint = Paint()..color = Colors.white..strokeWidth = 10.0;

  canvas.drawLine(Offset(0, center.height), Offset(size.width, center.height), paint);
}