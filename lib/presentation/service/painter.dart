
import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Offset _offset;
  MyCustomPainter(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    if (_offset == null) return;
    canvas.drawCircle(_offset, 10.0,  Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(MyCustomPainter other) => other._offset != _offset;
}
