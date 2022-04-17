import 'dart:ui';

import 'package:arcade_classic_new/domain/entity/particle.dart';
import 'package:flutter/material.dart';

import '../service/bubles.dart';
import '../service/painter.dart';
import '../service/path_painter.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;
  List<Particle> points = [];
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    generatePoints();
    super.initState();
    _animation = Tween(begin: 0.0, end: .50).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    path = drawPath();
  }

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
      BubblePainter(points);

      ///path = drawPath();
    });
  }

  List<Offset> offsetList = [];
  List<Color> colorList = [];
  List<double> sizeList = [];
  late Path path;

  Path drawPath() {
    Path path = Path();
    path.lineTo(random(0, 2800), random(0, 1800));
    return path;
  }

  generatePoints() {
    for (int i = 0; i < 1; i++) {
      offsetList.add(Offset(random(0, 1400), random(0, 600)));
      colorList.add(Colors.red);
      sizeList.add(random(20, 100));
    }
    points.add(Particle(offsetList, colorList, sizeList));
  }

  Offset calculate(value) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }

  @override
  Widget build(BuildContext context) {

    Widget particle = Positioned(
      top: calculate(_animation.value).dy,
      left: calculate(_animation.value).dx,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
        width: 20,
        height: 20,
      ),
    );

    return Container(
      color: Colors.black,
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: MouseRegion(
          onEnter: _incrementEnter,
          onHover: _updateLocation,
          onExit: _incrementExit,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                painter: PathPainter(path),
                foregroundPainter: MyCustomPainter(Offset(x, y)),
              ),
              particle,
            ],
          ),
        ),
      ),
    );
  }
}
