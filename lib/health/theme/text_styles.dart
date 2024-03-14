import 'package:flutter/material.dart';

class FontSizes {
  static double scale = 1.2;
  static double get body => 12 * scale;
  static double get bodySm => 10 * scale;
  static double get title => 14 * scale;
  static double get titleM => 16 * scale;
  static double get sizeXXl => 26 * scale;
}

class TextStyles {
  static TextStyle get title => TextStyle(fontSize: FontSizes.title);
  static TextStyle get titleM => TextStyle(fontSize: FontSizes.titleM);
  static TextStyle get titleNormal =>
      title.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get titleMedium =>
      titleM.copyWith(fontWeight: FontWeight.w300);
  static TextStyle get h1Style =>
      TextStyle(fontSize: FontSizes.sizeXXl, fontWeight: FontWeight.bold);

  static TextStyle get body =>
      TextStyle(fontSize: FontSizes.body, fontWeight: FontWeight.w300);
  static TextStyle get bodySm => body.copyWith(fontSize: FontSizes.bodySm);
}
