

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffffffff);
  static Color redColor = Color(0xffC91C22);
  static Color darkBlueColor = Color(0xff003E90);
  static Color pinkColor = Color(0xffED1E79);
  static Color brownColor = Color(0xffCF7E48);
  static Color blueColor = Color(0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color greyColor = Color(0xff4F5A69);
  static Color blackColor = Color(0xff303030);
  static Color darkPrimaryColor = Color(0xff1B5E20); // Darker shade of primary color
  static Color darkBackgroundColor = Color(0xff121212); // Dark background color
  static Color darkSurfaceColor = Color(0xff1E1E1E); // Dark surface color
  static Color darkGreyColor = Color(0xffB0B0B0); // Lighter grey for dark theme

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLightColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryColor,
    backgroundColor: darkBackgroundColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: darkPrimaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkPrimaryColor,
      background: darkBackgroundColor,
      surface: darkSurfaceColor,
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onBackground: whiteColor,
      onSurface: darkGreyColor,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkGreyColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: darkGreyColor,
      ),
    ),
  );
}
