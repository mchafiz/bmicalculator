import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQuaryData;
  static double screenWidth;
  static double screenHeight;
  static double blockHorizontal;
  static double blockVertical;
  void init(BuildContext context) {
    _mediaQuaryData = MediaQuery.of(context);
    screenWidth = _mediaQuaryData.size.width;
    screenHeight = _mediaQuaryData.size.height;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHeight / 100;
  }
}
