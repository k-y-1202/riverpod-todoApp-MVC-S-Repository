import 'package:flutter/material.dart';

// textStyle
class StyleName {
  static const title = TextStyle(
    fontSize: 16,
  );
  static const description = TextStyle(
    fontSize: 12,
    color: ColorName.grey,
  );
}

// color
class ColorName {
  static const black = Color(0xFF333333);
  static const grey = Color(0xFF9E9E9E);
}

// padding
class PaddingStyle {
  static const v8 = SizedBox(height: 8);
  static const v16 = SizedBox(height: 16);
  static const v32 = SizedBox(height: 32);
  static const h16 = SizedBox(width: 16);
  static const h32 = SizedBox(width: 32);
}
