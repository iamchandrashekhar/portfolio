import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/utils/global_context.dart';
import 'package:portfolio/src/screens/landing/headers.dart';
import 'package:portfolio/src/screens/landing/theme_toggle.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final pages = AppValue.pages;

  void onTap(int i) {
    tabController.animateTo(i, duration: fast);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return SafeArea(
      child: Scaffold(
        appBar: isDesktop(MediaQuery.of(context).size.width)
            ? AppBar(
                elevation: 4,
                shadowColor: Colors.black38,
                centerTitle: false,
                title: const Padding(
                  padding: EdgeInsets.only(left: defaultPadding),
                  child: TitleWidget(),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(right: defaultPadding),
                    child: ThemeToggle(),
                  ),
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: const Icon(Icons.menu_outlined),
                      );
                    },
                  ),
                  widthBox(defaultPadding * 2),
                ],
              )
            : null,
        endDrawer: Drawer(
          surfaceTintColor: Colors.white,
          child: Menu(
            tabController: tabController,
            onTap: onTap,
          ),
        ),
        endDrawerEnableOpenDragGesture: true,
        bottomNavigationBar: ResponsiveWidget(
          tablet: BottomNavigation(
            onTap: onTap,
            tabController: tabController,
          ),
          mobile: BottomNavigation(
            onTap: onTap,
            tabController: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: List.generate(
            pages.length,
            (index) => pages[index].widget,
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
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: RichText(
        text: TextSpan(
          children: const [
            TextSpan(
              text: AppValue.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: AppValue.surname,
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
    required this.tabController,
  }) : super(key: key);
  final ValueSetter<int> onTap;
  final TabController tabController;

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
          const Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: ThemeToggle(),
          ),
          Menu(
            onTap: onTap,
            tabController: tabController,
            isDesktop: false,
          ),
          widthBox(defaultPadding)
        ],
      ),
    );
  }
}
