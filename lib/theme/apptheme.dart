import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/theme/theme_constant.dart';

ThemeData lightTheme = getThemeData(isLightTheme: true);

ThemeData darkTheme = getThemeData(isLightTheme: false);

ThemeData getThemeData({required bool isLightTheme}) {
  return ThemeData(
    brightness: isLightTheme ? Brightness.light : Brightness.dark,
    useMaterial3: material3,
    appBarTheme:
        AppBarTheme(backgroundColor: isLightTheme ? bgLightColor : bgDarkColor),
    colorScheme: getColorScheme(isLightTheme: isLightTheme),
    scaffoldBackgroundColor: isLightTheme ? bgLightColor : bgDarkColor,
    textTheme: getTextTheme(isLightTheme: isLightTheme),
  );
}

ColorScheme getColorScheme({required bool isLightTheme}) {
  return isLightTheme
      ? ColorScheme.light(
          primary: bgLightColor,
          background: bgLightColor,
          secondary: redColor,
        )
      : ColorScheme.dark(
          primary: bgDarkColor,
          background: bgDarkColor,
          secondary: redColor,
        );
}

TextTheme getTextTheme({required bool isLightTheme}) {
  final color = isLightTheme ? textLightColor : textDarkColor;
  return GoogleFonts.notoSansTextTheme(TextTheme(
    displayLarge: TextStyle(color: color),
    displayMedium: TextStyle(color: color),
    displaySmall: TextStyle(color: color),
    //
    headlineLarge: TextStyle(color: color),
    headlineMedium: TextStyle(color: color),
    headlineSmall: TextStyle(color: color),
    //
    titleLarge: TextStyle(color: color),
    titleMedium: TextStyle(color: color),
    titleSmall: TextStyle(color: color),
    //
    labelLarge: TextStyle(color: color),
    labelMedium: TextStyle(color: color),
    labelSmall: TextStyle(color: color),
    //
    bodyLarge: TextStyle(color: color),
    bodyMedium: TextStyle(color: color),
    bodySmall: TextStyle(color: color),
  ));
}
