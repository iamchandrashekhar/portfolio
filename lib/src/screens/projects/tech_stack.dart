import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:portfolio/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class TechStack extends StatelessWidget {
  const TechStack({super.key, required this.techList});
  final List<String> techList;

  @override
  Widget build(BuildContext context) {
    bool isLightMode = !context.read<ThemeManager>().isDark();
    return Row(
      children: List.generate(
        techList.length,
        (index) => Transform.translate(
          offset: Offset(index * -8, 0),
          child: Container(
            width: techStackSize,
            height: techStackSize,
            padding: EdgeInsets.all(defaultPadding / 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: socialBgLight,
              border: isLightMode
                  ? Border.all(
                      color: socialBgDark,
                      width: 0.3,
                    )
                  : null,
            ),
            child: SvgPicture.asset(techList[index]),
          ),
        ),
      ),
    );
  }
}
