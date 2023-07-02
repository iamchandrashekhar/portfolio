import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/landing_provider.dart';

double screenWidth({BuildContext? ctx, double width = 1}) {
  if (ctx != null) {
    return MediaQuery.of(ctx).size.width * width;
  }
  return MediaQuery.of(mainContext!).size.width * width;
}

double screenHeight({BuildContext? ctx, double height = 1}) {
  if (ctx != null) {
    return MediaQuery.of(ctx).size.height * height;
  }
  return MediaQuery.of(mainContext!).size.height * height;
}
