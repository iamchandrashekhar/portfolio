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
          image: skillsList[index].svgSource,
          name: skillsList[index].title!,
        ),
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  const SkillsCard({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    const double size = 70;
    return Padding(
      padding: EdgeInsets.only(
          bottom: defaultPadding * 2, right: defaultPadding * 2),
      child: Container(
        width: 170,
        height: 150,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 2,
          vertical: defaultPadding * 1.5,
        ),
        decoration: BoxDecoration(
          color: txt.bodyLarge!.color!.withOpacity(0.07),
          borderRadius: BorderRadius.all(Radius.circular(defaultRadius * 2)),
        ),
        child: FittedBox(
          child: Column(
            children: [
              SvgPicture.asset(
                image,
                width: size,
                height: size,
                colorFilter: image.contains("flask")
                    ? ColorFilter.mode(txt.bodyLarge!.color!, BlendMode.srcATop)
                    : const ColorFilter.mode(
                        Colors.transparent, BlendMode.clear),
              ),
              heightBox(defaultPadding * 1.5),
              Text(
                name,
                style: txt.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
