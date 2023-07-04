import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
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
  PageController pageController = PageController(initialPage: 0);

  final pages = AppValue.pages;
  Device? device;

  @override
  void dispose() {
    pageController.removeListener(updateIndex);
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(updateIndex);
  }

  void updateIndex() {
    double page = (pageController.page ?? 0);
    int p = page.toInt();
    if (page - p > 0.8) {
      p++;
    }
    context.read<LandingProvider>().updateHeaderIndex(p);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: fast, curve: Curves.easeInOut);
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
                    onTap: (index) {
                      pageController.animateToPage(index,
                          duration: fast, curve: Curves.easeInOut);
                    },
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
        body: PageView.builder(
          controller: pageController,
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => pages[index].widget,
          itemCount: pages.length,
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
