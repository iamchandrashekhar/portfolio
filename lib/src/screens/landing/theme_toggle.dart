import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool lightMode = context.select<ThemeManager, bool>(
      (p) => !p.isDark(),
    );
    return Center(
      child: GestureDetector(
        onTap: () {
          context.read<ThemeManager>().toggleTheme();
        },
        child: AnimatedSwitcher(
          duration: medium,
          transitionBuilder: (child, animation) {
            return RotationTransition(
              turns: lightMode
                  ? Tween<double>(begin: 1, end: 0.75).animate(animation)
                  : Tween<double>(begin: 1, end: 0.75).animate(animation),
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: lightMode
              ? Icon(
                  Icons.sunny,
                  key: const ValueKey('Sun'),
                  size: 30,
                  color: theme.iconTheme.color,
                )
              : Icon(
                  Icons.dark_mode,
                  key: const ValueKey('Moon'),
                  size: 30,
                  color: theme.iconTheme.color,
                ),
        ),
      ),
    );
  }
}
