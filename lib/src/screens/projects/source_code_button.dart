import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

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
    return Link(
        uri: Uri.parse(link),
        target: LinkTarget.blank,
        builder: (context, followLink) {
          return InkWell(
            onTap: followLink,
            child: AppImage(
              icon,
              width: techStackSize,
              height: techStackSize,
              colorFilter: isLightMode
                  ? ColorFilter.mode(socialBgDark, BlendMode.srcATop)
                  : ColorFilter.mode(socialBgLight, BlendMode.srcATop),
            ),
          );
        });
  }
}
