import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorsData.primaryColor,
    scaffoldBackgroundColor: ColorsData.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsData.secondaryColor,
      foregroundColor: ColorsData.textColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsData.textColor),
      bodyMedium: TextStyle(color: ColorsData.textColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsData.bottomsColor,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsData.darkPrimaryColor,
    scaffoldBackgroundColor: ColorsData.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsData.darkSecondaryColor,
      foregroundColor: ColorsData.darkTextColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsData.darkTextColor),
      bodyMedium: TextStyle(color: ColorsData.darkTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsData.darkBottomsColor,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
