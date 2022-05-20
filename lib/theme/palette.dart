import 'package:flutter/material.dart';

class Palette {
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFF0C0B09);
  static const Color base1 = Color(0xFF171615);
  //
  static const Color overlay1 = Color(0xFFF7F7F7);
  static const Color overlay2 = Color(0xFFA19999);
  //
  static const Color primary = Color(0xFF6BE7C8);
  static const Color tertriary = Color(0xFF00A0AF);

  // Chart
  static const List<Color> lineGradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  static const Color chartBorder = Color(0xff232d37);
  static const Color leftTitle = Color(0xff67727d);
  static const Color popupTitle = Color(0xff68737d);
  static const Color lineColor = Color(0xff68737d);

  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF00A0AF),
      Color(0xFF6BE7C8),
    ],
  );
}
