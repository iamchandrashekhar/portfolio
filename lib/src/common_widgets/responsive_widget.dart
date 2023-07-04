import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/responsive.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, this.mobile, this.tablet, this.desktop});
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isMobile(constraints.maxWidth)) {
          return mobile ?? const SizedBox();
        } else if (isTablet(constraints.maxWidth)) {
          return tablet ?? const SizedBox();
        } else {
          return desktop ?? const SizedBox();
        }
      },
    );
  }
}
