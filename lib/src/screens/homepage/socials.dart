import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class Social extends StatelessWidget {
  const Social({super.key, required this.svgPath});
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    bool isLightMode = !context.read<ThemeManager>().isDark();
    final theme = Theme.of(context);
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(defaultPadding),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          boxShadow: [
            BoxShadow(
                color: socialBgDark.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(4, 4),
                spreadRadius: 1),
            if (isLightMode)
              BoxShadow(
                  color: socialBgLight.withOpacity(0.5),
                  blurRadius: 15,
                  offset: const Offset(-4, -4),
                  spreadRadius: 1),
          ]),
      child: AppImage(
        svgPath,
        colorFilter: ColorFilter.mode(
          theme.textTheme.bodyLarge!.color!,
          BlendMode.srcATop,
        ),
      ),
    );
  }
}
