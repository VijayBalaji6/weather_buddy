import 'package:flutter/material.dart';

class ThemeColor {
  ThemeData get themeData {
    ColorScheme colorScheme = const ColorScheme(
      primary: Color(0xFFE9DDC1),
      surface: Color(0xFFFFFFFF),
      background: Color(0xffF1F3F4),
      secondary: Color(0xFF193258),
      error: Color(0xffE2173A),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xff239DD1),
      onSurface: Color(0xFF193258),
      onBackground: Color(0xff606260),
      onError: Color(0xffE2173A),
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorScheme);
  }
}
