import 'package:flutter/material.dart';

abstract class ColorsData {
  static  Color primaryColor = Colors.white;
  static const Color secondaryColor = Color(0xffD2B48C);
  static const Color bottomsColor = Color(0xffA0522D);
  static const Color textColor = Color(0xff4B2E1E);
  // Dark Theme Colors
  static const Color darkPrimaryColor = Color(0xff2C2C2C);
  static const Color darkSecondaryColor = Color(0xff3E3E3E);
  static const Color darkBottomsColor = Color(0xff8B5E3C);
  static const Color darkTextColor = Color(0xffF5DEB3);
}

abstract class AssetsData {
  static const String logoLight = "assets/images/logo_light_theme.png";
  static const String logoLight2 = "assets/images/logo2_light_theme.png";
  static const String logoDark = "assets/images/logo_dark_theme.png";
}

abstract class TextStyles {}
