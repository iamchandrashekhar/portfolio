import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme_constant.dart';

class TechBadge extends StatelessWidget {
  const TechBadge({super.key, required this.svgPath});
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.onBackground,
      ),
      child: SvgPicture.asset(
        svgPath,
        width: 30,
        height: 30,
      ),
    );
  }
}
