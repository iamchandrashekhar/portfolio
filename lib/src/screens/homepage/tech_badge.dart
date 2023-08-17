import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';

class TechBadge extends StatelessWidget {
  const TechBadge({
    super.key,
    required this.svgPath,
    required this.size,
    required this.reduceBy,
  });

  final String svgPath;
  final Size size;
  final double reduceBy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final svgW = size.width * reduceBy;
    final svgH = size.height * reduceBy;
    return Container(
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      // padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.onBackground,
      ),
      child: AppImage(
        svgPath,
        width: svgW,
        height: svgH,
      ),
    );
  }
}
