import 'package:flutter/material.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HeaderMenu extends StatelessWidget {
  HeaderMenu({
    super.key,
    required this.onTap,
  });

  ValueChanged<int> onTap;
  final List<String> pages = ["Home", "Projects", "Skills", "About"];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Selector<LandingProvider, int>(
      selector: (_, provider) => provider.headerIndex,
      builder: (context, header, _) {
        return Row(
          children: List.generate(
            pages.length,
            (index) => GestureDetector(
              onTap: () => onTap.call(index),
              child: Container(
                margin: EdgeInsets.only(right: defaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                  color: header == index
                      ? theme.colorScheme.secondary
                      : Colors.transparent,
                  borderRadius:
                      BorderRadius.all(Radius.circular(defaultRadius)),
                ),
                child: Text(
                  pages[index],
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: header == index ? textDarkColor : null,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
