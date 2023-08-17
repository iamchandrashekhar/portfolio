import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.colorFilter,
  });
  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return source.startsWith("http")
        ? SvgPicture.network(
            source,
            width: width,
            height: height,
            fit: fit,
            colorFilter: colorFilter,
          )
        : SvgPicture.asset(
            source,
            width: width,
            height: height,
            fit: fit,
            colorFilter: colorFilter,
          );
  }
}
