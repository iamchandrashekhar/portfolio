import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/projects/project_card.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset("assets/images/blob/Blob.svg"),
          ),
          const ProjectBody(),
        ],
      ),
    );
  }
}

class ProjectBody extends StatelessWidget {
  const ProjectBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(builder: (context, constraint) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveValues<double>(
            defaultPadding * 2,
            defaultPadding * 2.5,
            defaultPadding * 3,
          ),
        ),
        child: ResponsiveWidget(
          mobile: const _MobileAndTablet(),
          tablet: const _MobileAndTablet(),
          desktop: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: headingAndBody(theme: theme),
                  ),
                ),
              ),
              const ProjectCards(),
            ],
          ),
        ),
      );
    });
  }
}

List<Widget> headingAndBody({
  required ThemeData theme,
  TextAlign txtAlign = TextAlign.left,
}) {
  final txt = theme.textTheme;
  return [
    Text(
      AppValue.myProjects,
      style: txt.displayLarge!.copyWith(
        color: theme.colorScheme.secondary,
        fontWeight: FontWeight.bold,
      ),
      textAlign: txtAlign,
    ),
    heightBox(defaultPadding),
    Text(
      AppValue.projectsAbout,
      style: txt.titleLarge!.copyWith(
        height: 2,
        // color: getColor(light: darkGrey, dark: lightGrey),
      ),
      textAlign: txtAlign,
    ),
    heightBox(defaultPadding * 2),
  ];
}

class _MobileAndTablet extends StatelessWidget {
  const _MobileAndTablet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: headingAndBody(theme: theme),
          ),
        ),
        const ProjectCards(),
      ],
    );
  }
}
