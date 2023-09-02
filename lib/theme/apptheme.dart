import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_constant.dart';

ThemeData lightTheme = getThemeData(isLightTheme: true);

ThemeData darkTheme = getThemeData(isLightTheme: false);

ThemeData getThemeData({required bool isLightTheme}) {
  return ThemeData(
    brightness: isLightTheme ? Brightness.light : Brightness.dark,
    useMaterial3: material3,
    textSelectionTheme:
        TextSelectionThemeData(selectionColor: redColor.withOpacity(0.4)),
    appBarTheme:
        AppBarTheme(backgroundColor: isLightTheme ? bgLightColor : bgDarkColor),
    colorScheme: getColorScheme(isLightTheme: isLightTheme),
    scaffoldBackgroundColor: isLightTheme ? bgLightColor : bgDarkColor,
    textTheme: getTextTheme(isLightTheme: isLightTheme),
    elevatedButtonTheme: getElevatedBtnThm(),
  );
}

ColorScheme getColorScheme({required bool isLightTheme}) {
  return isLightTheme
      ? ColorScheme.light(
          primary: bgLightColor,
          background: bgLightColor,
          secondary: redColor,
          onBackground: socialBgLight,
        )
      : ColorScheme.dark(
          primary: bgDarkColor,
          background: bgDarkColor,
          secondary: redColor,
          onBackground: socialBgDark,
        );
}

TextTheme getTextTheme({required bool isLightTheme}) {
  final color = isLightTheme ? textLightColor : textDarkColor;

  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    displayMedium: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    displaySmall: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    //
    headlineLarge: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    headlineMedium: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    headlineSmall: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    //
    titleLarge: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    titleMedium: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    titleSmall: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    //
    labelLarge: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    labelMedium: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    labelSmall: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    //
    bodyLarge: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    bodyMedium: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
    bodySmall: TextStyle(
      fontFamily: "Outfit",
      color: color,
      fontVariations: const [FontVariation('wght', 400)],
    ),
  );
}

ElevatedButtonThemeData getElevatedBtnThm() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(redColor),
      foregroundColor: MaterialStatePropertyAll(textDarkColor),
      overlayColor: MaterialStatePropertyAll(redColor),
      visualDensity: VisualDensity.standard,
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadius * 2),
          ),
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          vertical: defaultPadding,
          horizontal: defaultPadding * 1.5,
        ),
      ),
    ),
  );
}
