import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
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
    final txt = theme.textTheme;
    const double size = 60;
    return Padding(
      padding:
          EdgeInsets.only(bottom: defaultPadding, right: defaultPadding * 1.5),
      child: Container(
        width: 150,
        height: 130,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 2,
          vertical: defaultPadding * 1.5,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius * 2)),
        ),
        child: FittedBox(
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                width: size,
                height: size,
              ),
              heightBox(defaultPadding),
              Text(
                "Flutter",
                style: txt.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
