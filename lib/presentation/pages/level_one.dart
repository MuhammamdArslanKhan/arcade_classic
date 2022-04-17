
import 'package:flutter/material.dart';

import '../service/painter.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;
 List<Offset> points = [];

 @override
  void initState() {
    generatePoints();
    super.initState();
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
    });
  }

  generatePoints(){
    for(int i = 0; i < 20;i++ ){
      points.add(  Offset(random(0,1400),random(0,600)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black,
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
        child: MouseRegion(
          onEnter: _incrementEnter,
          onHover: _updateLocation,
          onExit: _incrementExit,
          child: CustomPaint(
            // key: _paintKey,
            painter:   MyCustomPainter(Offset(x, y),points),
            child:  ConstrainedBox(
              constraints:  const BoxConstraints.expand(),
            ),
          ),
        ),
      ),
    );
  }

}