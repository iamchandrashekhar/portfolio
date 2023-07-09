import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

bool isMobile(double width) {
  return width < 700;
}

bool isTablet(double width) {
  return width < 1023;
}

bool isDesktop(double width) {
  return width > 1023;
}

Color getColor({required Color light, required Color dark}) {
  return mainContext!.read<ThemeManager>().isDark() ? dark : light;
}

T responsiveValues<T>(T mobile, T tablet, T desktop) {
  double w = MediaQuery.of(mainContext!).size.width;
  if (isMobile(w)) {
    return mobile;
  } else if (isTablet(w)) {
    return tablet;
  } else {
    return desktop;
  }
}
