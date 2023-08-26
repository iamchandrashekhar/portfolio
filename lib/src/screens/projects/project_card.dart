import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/projects/source_code_button.dart';
import 'package:portfolio/src/screens/projects/tech_stack.dart';
import 'package:portfolio/src/utils/assets_list.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class ProjectCards extends StatelessWidget {
  const ProjectCards({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = AppValue.projectList;
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: List.generate(
        projects.length,
        (index) => Padding(
          padding: const EdgeInsets.only(
              top: defaultPadding * 4, right: defaultPadding * 4),
          child: _CardWidget(
            name: projects[index].name,
            description: projects[index].description,
            techStack: projects[index].techStack,
            link: projects[index].link,
          ),
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    required this.name,
    required this.description,
    required this.techStack,
    required this.link,
  });
  final String name;
  final String description;
  final List<String> techStack;
  final String link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    const double size = 350;
    bool isLightMode = !context.read<ThemeManager>().isDark();
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(defaultPadding * 2),
      decoration: BoxDecoration(
        color: theme.colorScheme.onBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultRadius * 3),
        ),
        boxShadow: [
          BoxShadow(
              color: socialBgDark.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(4, 4),
              spreadRadius: 1),
          if (isLightMode)
            BoxShadow(
                color: socialBgLight.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(-4, -4),
                spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: txt.headlineMedium!.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          heightBox(defaultPadding),
          Expanded(
            flex: 4,
            child: Text(
              description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: txt.titleMedium!.copyWith(height: 2),
            ),
          ),
          heightBox(defaultPadding),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TechStack(techList: techStack),
                SourceCodeLink(
                  icon: AppImagesSource.githubCircleIcon,
                  link: link,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
