import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:portfolio/src/screens/landing/headers.dart';
import 'package:portfolio/src/screens/landing/theme_toggle.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  final pages = AppValue.pages;
  ScrollController scrollController = ScrollController();

  // Global keys only for getting widget's size
  // So we can scroll to specific widget and update top nav bar index
  List<GlobalKey> globalKeys = [];
  List<double> widgetsHeight = [];
  List<double> heightSum = [];
  bool isAnimating = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(updateHeaderWhileScroll);

    // After widget build we get size of each widget using global keys
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getWidgetSize();
    });
  }

  /// Getting each widget size with global keys attach to them
  void getWidgetSize() {
    for (int i = 0; i < globalKeys.length; i++) {
      widgetsHeight.add(globalKeys[i].currentContext!.size!.height);
      heightSum.add(widgetsHeight.fold<double>(0, (v, e) => v + e));
    }
  }

  /// Calculate scrolling offset when we navigate through nav bar
  double calculatePosition(int index) {
    double position = widgetsHeight
        .sublist(0, index)
        .fold<double>(0, (previousValue, element) => previousValue + element);
    double scrollTo = min(scrollController.position.maxScrollExtent, position);
    return scrollTo;
  }

  /// Calculate offset and update index for nav bar indicator
  void updateHeaderWhileScroll() {
    if (!isAnimating) {
      double offset = scrollController.offset;
      if (offset < scrollController.position.maxScrollExtent) {
        int i = 0;
        for (i; i < heightSum.length; i++) {
          if (offset < heightSum[i]) {
            break;
          }
        }
        double pos = offset - (heightSum[i] - widgetsHeight[i]);
        pos = pos / widgetsHeight[i];
        if (pos > 0.8) {
          i++;
        }
        context.read<LandingProvider>().updateHeaderIndex(i);
      } else {
        context
            .read<LandingProvider>()
            .updateHeaderIndex(widgetsHeight.length - 1);
      }
    }
  }

  /// Method to scroll to specific widget
  void onTap(int index) {
    isAnimating = true;
    setState(() {});

    context.read<LandingProvider>().updateHeaderIndex(index);
    scrollController
        .animateTo(calculatePosition(index),
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceInOut)
        .then((value) {
      setState(() {
        isAnimating = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return SafeArea(
      child: Scaffold(
        appBar: isDesktop(MediaQuery.of(context).size.width)
            ? AppBar(
                title: const TitleWidget(),
                actions: [
                  Header(
                    horizontal: true,
                    onTap: onTap,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: defaultPadding),
                    child: const ThemeToggle(),
                  ),
                ],
              )
            : null,
        bottomNavigationBar: ResponsiveWidget(
          tablet: BottomNavigation(onTap: onTap),
          mobile: BottomNavigation(onTap: onTap),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: List.generate(pages.length, (index) {
              final key = GlobalKey<_LandingPageState>();
              globalKeys.add(key);
              return SizedBox(key: key, child: pages[index].widget);
            }, growable: false),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: RichText(
        text: TextSpan(
          children: const [
            TextSpan(
              text: "CHANDRASHEKHAR ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "PANWAR",
            ),
          ],
          style: txt.titleLarge,
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          const Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: TitleWidget(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: const ThemeToggle(),
          ),
          Header(
            horizontal: false,
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
