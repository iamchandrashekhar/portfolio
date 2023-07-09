import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class SourceCodeLink extends StatelessWidget {
  const SourceCodeLink({
    super.key,
    required this.icon,
    required this.link,
  });
  final String icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    bool isLightMode = !context.read<ThemeManager>().isDark();
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        icon,
        width: techStackSize,
        height: techStackSize,
        colorFilter: isLightMode
            ? ColorFilter.mode(socialBgDark, BlendMode.srcATop)
            : ColorFilter.mode(socialBgLight, BlendMode.srcATop),
      ),
    );
  }
}
