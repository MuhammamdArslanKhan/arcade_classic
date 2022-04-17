import 'package:arcade_classic_new/presentation/pages/level_one.dart';
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

