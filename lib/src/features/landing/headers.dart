import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onTap,
    this.horizontal = true,
  });

  final ValueChanged<int> onTap;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    return horizontal ? _Horizontal(onTap: onTap) : AnimatedMenu(onTap: onTap);
  }
}

class _Horizontal extends StatelessWidget {
  const _Horizontal({
    required this.onTap,
  });

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pages = AppValue.pages;
    return Selector<LandingProvider, int>(
      selector: (_, provider) => provider.headerIndex,
      builder: (context, header, _) {
        return Row(
          children: List.generate(
            pages.length,
            (index) => GestureDetector(
              onTap: () => onTap.call(index),
              child: AnimatedContainer(
                duration: fast,
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
                  pages[index].name,
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

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({super.key, required this.onTap});
  final ValueChanged<int> onTap;
  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  bool menuOpen = false;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: fast);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (menuOpen) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
        menuOpen = !menuOpen;
        showModalBottomSheet(
          context: context,
          builder: (context) => _Grid(
            onTap: widget.onTap,
          ),
          transitionAnimationController: animationController,
        );
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: animation,
      ),
    );
  }
}

class _Grid extends StatelessWidget {
  _Grid({required this.onTap});
  final ValueChanged<int> onTap;
  final pages = AppValue.pages;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Selector<LandingProvider, int>(
              selector: (_, provider) => provider.headerIndex,
              builder: (context, header, _) {
                return Wrap(
                  children: List.generate(
                    pages.length,
                    (index) => GestureDetector(
                      onTap: () => onTap(index),
                      child: AnimatedContainer(
                        width: 100,
                        height: 80,
                        duration: fast,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(defaultPadding / 2),
                        padding: EdgeInsets.all(defaultPadding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              pages[index].svgPath,
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                  header == index
                                      ? theme.colorScheme.secondary
                                      : theme.textTheme.bodyLarge!.color!,
                                  BlendMode.srcATop),
                            ),
                            heightBox(8),
                            Text(
                              pages[index].name,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: header == index
                                    ? theme.colorScheme.secondary
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          heightBox(defaultPadding),
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close))
        ],
      ),
    );
  }
}
