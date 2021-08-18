import 'package:flutter/material.dart';

class AppTheme {
  static Color gradientColorFrom = Color(0xff162e4d);
  static Color gradientColorTo = Color(0xff172e4d);

  static String firstFontName = "Ubuntu";
  static String secondFontName = "Lobster";

  static TextStyle loginTitleStyle =
      TextStyle(fontFamily: secondFontName, fontSize: 40, color: Colors.white);

  static TextStyle loginSubTitleTitleStyle = TextStyle(
      fontFamily: secondFontName, fontSize: 20, color: Colors.white70);

  static TextStyle loginHelpStyle =
      TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);

  static BoxDecoration loginContainerBoxdecoration = BoxDecoration(
    gradient:
        LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft,
            // colors: [Color(0xff023b47), Color(0xff207b7d)]),
            colors: [gradientColorFrom, gradientColorTo]),
  );
}
