import 'package:flutter/material.dart';
import 'package:portfolio/src/screens/homepage/tech_badge.dart';
import 'package:portfolio/src/utils/values.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    final tech = AppValue.techBadges;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.person_outline,
            size: 400,
          ),
          Positioned(
              top: 150, right: 40, child: TechBadge(svgPath: tech['python']!)),
          const Icon(
            Icons.person_outline,
            size: 400,
          )
        ],
      ),
    );
  }
}
