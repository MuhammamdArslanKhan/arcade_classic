import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  int bubblesLimit = 20;
  List<Offset> points =[];
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 10;
    //list of points
    for(int i = 0; i<bubblesLimit;i++ ){
      points.add(  Offset(random(0,600),random(0,600)));
      canvas.drawPoints(PointMode.points, points, paint1);
    }
/*    var points = [Offset(50, 50),
      Offset(80, 70),
      Offset(380, 175),
      Offset(200, 175),
      Offset(150, 105),
      Offset(300, 75),
      Offset(320, 200),
      Offset(89, 125)];
    //draw points on canvas
    canvas.drawPoints(PointMode.points, points, paint1);*/
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

double random(min, max) {
  return (min + Random().nextInt(max - min)) as double;
}