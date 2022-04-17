import 'dart:ui';
import 'package:flutter/material.dart';

class SampleAnimation extends StatefulWidget{

  const SampleAnimation();

  @override
  State<StatefulWidget> createState() {
    return SampleAnimationState();
  }
}

class SampleAnimationState extends State<SampleAnimation> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;
  late Path _path;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 5000));
    super.initState();
    _animation = Tween(begin: 0.0,end: .50).animate(_controller)
      ..addListener((){
        setState(() {
        });
      });
    _controller.forward();
    _path  = drawPath();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: CustomPaint(
              painter: PathPainter(_path),
            ),
          ),
          Positioned(
            top: calculate(_animation.value).dy,
            left: calculate(_animation.value).dx,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 10,
              height: 10,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Path drawPath(){
    Size size = Size(300,300);
    Path path = Path();
    //path.moveTo(0, 800);
   path.lineTo(2800, 1800);
    // path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height / 2);
    return path;
  }


  Offset calculate(value) {
    PathMetrics pathMetrics = _path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }

}


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