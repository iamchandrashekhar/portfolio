import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    final skillsList = AppValue.skillsList;
    return Wrap(
      children: List.generate(
        skillsList.length,
        (index) => SkillsCard(
          image: skillsList[index],
        ),
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double size = 70;
    return Padding(
      padding: EdgeInsets.all(defaultPadding).copyWith(left: 0),
      child: Container(
        width: size + 10,
        height: size + 10,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(defaultRadius * 2)),
            boxShadow: [
              BoxShadow(
                color: theme.textTheme.bodyLarge!.color!.withOpacity(0.3),
              ),
              BoxShadow(
                color: theme.colorScheme.background,
                spreadRadius: -5.0,
                blurRadius: 12.0,
              )
            ]),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SvgPicture.asset(
            image,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
