import 'package:flutter/material.dart';

class ColorPalette {
  static Color fontColor = Colors.grey[850];
  static Color secondaryColor = Colors.white;
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
