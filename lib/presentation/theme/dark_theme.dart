import 'package:flutter/material.dart';

import '../values/colors.dart';

ThemeData get darkTheme {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    scaffoldBackgroundColor: windowBackgroundColor,
    textTheme: _textTheme,
    iconTheme: _iconTheme,
   // appBarTheme: _appBarTheme
  );
}

///[TextTheme]
TextTheme get _textTheme {
  const TextStyle baseTextStyle = TextStyle(
    color: Colors.white,
  );
  return TextTheme(
    headline4: baseTextStyle.copyWith(
      fontSize: 25,
      fontWeight: FontWeight.w700,
    ),
    headline5: baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: dimTextColorDark,
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
    bodyText2: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: dimTextColorDark,
    ),
    button: baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );
}


///[IconThemeData]
IconThemeData get _iconTheme => const IconThemeData(
  color: Colors.white
);

//AppBarTheme get _appBarTheme => AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));