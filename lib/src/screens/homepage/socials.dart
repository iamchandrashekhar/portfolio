import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';

class Social extends StatelessWidget {
  const Social({
    super.key,
    required this.svgPath,
    required this.link,
    required this.semanticsLabel,
  });
  final String svgPath;
  final String link;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    bool isLightMode = !context.read<ThemeManager>().isDark();
    final theme = Theme.of(context);
    late Uri uri;
    if (RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$').hasMatch(link)) {
      uri = Uri(scheme: "mailto", path: link);
    } else {
      uri = Uri.parse(link);
    }
    return Link(
      uri: uri,
      target: LinkTarget.blank,
      builder: (context, followLink) {
        return InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: followLink,
          child: Container(
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
              semanticsLabel: semanticsLabel,
              colorFilter: ColorFilter.mode(
                theme.textTheme.bodyLarge!.color!,
                BlendMode.srcATop,
              ),
            ),
          ),
        );
      },
    );
  }
}
