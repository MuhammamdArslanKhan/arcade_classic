import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      textTheme: _textTheme,
      //appBarTheme: _appBarTheme,
      iconTheme: _iconTheme);
}


///[TextTheme]
TextTheme get _textTheme {
  final TextStyle baseTextStyle = const TextStyle(
    color: Colors.black,
  );
  // Please note:
  // FontWeight.w500 = medium
  // FontWeight.w600 = semi-bold
  // FontWeight.w700 = bold
  return TextTheme(
    headline4: baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headline6: baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    subtitle2: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    button: baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );
}

IconThemeData get _iconTheme => IconThemeData(color: Colors.black);
