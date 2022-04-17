
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Offset _offset;
  int bubblesLimit = 3;
  List<Offset> points =[];
  MyCustomPainter(this._offset,this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (_offset == null) return;
    canvas.drawCircle(_offset, 10.0,  Paint()..color = Colors.white);

    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..strokeCap = StrokeCap.round //rounded points
      ..strokeWidth = 40;
    //list of points
    for(int i = 0; i<bubblesLimit;i++ ){
      canvas.drawPoints(PointMode.points, points, paint1);
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => other._offset != _offset;
}


double random(min, max) {
  return (min + Random().nextInt(max - min)) as double;
}