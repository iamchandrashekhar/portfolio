import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/skiils/skills_list.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 75.h),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveValues<double>(
            defaultPadding * 1.5,
            defaultPadding * 2.5,
            defaultPadding * 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppValue.skills,
              style: txt.displayLarge!.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
              // textAlign: txtAlign,
            ),
            heightBox(defaultPadding),
            const SkillsList(),
            heightBox(defaultPadding),
          ],
        ),
      ),
    );
  }
}
