import 'package:flutter/material.dart';
import 'package:portfolio/src/screens/homepage/tech_badge.dart';
import 'package:portfolio/src/utils/values.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    final tech = AppValue.techBadges;
    const double size = 400;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: size * 0.23,
            right: size * 0.14,
            child: TechBadge(
              svgPath: tech['python']!,
              size: const Size(size * 0.12, size * 0.12),
              reduceBy: 0.50,
            ),
          ),
          Positioned(
            top: size * 0.35,
            left: size * 0.13,
            child: TechBadge(
              svgPath: tech['flutter']!,
              size: const Size(size * 0.12, size * 0.14),
              reduceBy: 0.47,
            ),
          ),
          const Icon(
            Icons.person_outline,
            size: size,
          ),
          Positioned(
            top: size * 0.47,
            right: size * 0.12,
            child: TechBadge(
              svgPath: tech['ansible']!,
              size: const Size(size * 0.12, size * 0.12),
              reduceBy: 0.60,
            ),
          ),
          Positioned(
            bottom: size * 0.20,
            left: size * 0.12,
            child: TechBadge(
              svgPath: tech['docker']!,
              size: const Size(size * 0.14, size * 0.14),
              reduceBy: 0.65,
            ),
          ),
          Positioned(
            bottom: size * 0.10,
            right: size * 0.12,
            child: TechBadge(
              svgPath: tech['kubernetes']!,
              size: const Size(size * 0.16, size * 0.16),
              reduceBy: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
