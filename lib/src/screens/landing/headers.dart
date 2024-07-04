import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.onTap,
    required this.tabController,
    this.isDesktop = true,
  });

  final ValueChanged<int> onTap;
  final TabController tabController;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? DrawerMenu(
            tabController: tabController,
            onTap: onTap,
          )
        : BottomSheetMenu(
            onTap: onTap,
            tabController: tabController,
          );
  }
}

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    super.key,
    required this.onTap,
    required this.tabController,
  });

  final ValueChanged<int> onTap;
  final TabController tabController;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    final pages = AppValue.pages;
    final theme = Theme.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: Scaffold.of(context).closeEndDrawer,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Icon(Icons.close, color: theme.iconTheme.color),
            ),
          ),
        ),
        heightBox(20),
        ...List.generate(
          pages.length,
          (index) => InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              widget.onTap.call(index);
              setState(() {});
            },
            child: AnimatedContainer(
              duration: fast,
              margin: const EdgeInsets.only(right: defaultPadding),
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding / 2),
              child: Text(
                pages[index].name,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: widget.tabController.index == index
                      ? theme.colorScheme.secondary
                      : null,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class BottomSheetMenu extends StatefulWidget {
  const BottomSheetMenu(
      {super.key, required this.onTap, required this.tabController});
  final ValueChanged<int> onTap;
  final TabController tabController;
  @override
  State<BottomSheetMenu> createState() => _BottomSheetMenuState();
}

class _BottomSheetMenuState extends State<BottomSheetMenu>
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
    final theme = Theme.of(context);
    final pages = AppValue.pages;
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
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: StatefulBuilder(builder: (context, chState) {
                      return Wrap(
                        children: List.generate(
                          pages.length,
                          (index) => GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              widget.onTap(index);
                              chState(() {});
                            },
                            child: AnimatedContainer(
                              width: 100,
                              height: 80,
                              duration: fast,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(defaultPadding / 2),
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppImage(
                                    pages[index].svgPath,
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                      widget.tabController.index == index
                                          ? theme.colorScheme.secondary
                                          : theme.textTheme.bodyLarge!.color!,
                                      BlendMode.srcATop,
                                    ),
                                  ),
                                  heightBox(8),
                                  Text(
                                    pages[index].name,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: widget.tabController.index == index
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
                    }),
                  ),
                  heightBox(defaultPadding),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: theme.iconTheme.color),
                  )
                ],
              ),
            );
          },
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
