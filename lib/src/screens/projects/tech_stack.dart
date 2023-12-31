import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
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
            padding: const EdgeInsets.all(defaultPadding / 3),
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
            child: AppImage(
              techList[index],
              colorFilter: techList[index].contains("flask")
                  ? ColorFilter.mode(textLightColor, BlendMode.srcATop)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
