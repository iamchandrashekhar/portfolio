import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  return GoogleFonts.outfitTextTheme(
    TextTheme(
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
