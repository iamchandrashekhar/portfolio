import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
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
              ? const Icon(
                  Icons.sunny,
                  key: ValueKey('Sun'),
                  size: 30,
                )
              : const Icon(
                  Icons.dark_mode,
                  key: ValueKey('Moon'),
                  size: 30,
                ),
        ),
      ),
    );
  }
}
