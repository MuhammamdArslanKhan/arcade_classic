import 'dart:ui';

import 'package:arcade_classic_new/presentation/pages/level_one.dart';
import 'package:arcade_classic_new/presentation/service/painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

