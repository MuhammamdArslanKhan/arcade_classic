
import 'dart:math';
import 'dart:ui';

import 'package:arcade_classic_new/domain/entity/particle.dart';
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Offset _offset;
  int bubblesLimit = 3;
  MyCustomPainter(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    if (_offset == null) return;
    canvas.drawCircle(_offset, 10.0,  Paint()..color = Colors.white);

/*
    //list of points
      var paint1 = Paint()
        ..color = Colors.red
        ..strokeCap = StrokeCap.round //rounded points
        ..strokeWidth = 30;
      canvas.drawPoints(PointMode.points, points[0].offset, paint1);*/
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => other._offset != _offset;
}

