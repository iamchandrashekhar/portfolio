import 'package:flutter/material.dart';
import 'package:portfolio/src/features/landing/headers.dart';
import 'package:portfolio/src/features/landing/theme_toggle.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
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
  PageController pageController = PageController(initialPage: 0);

  final pages = AppValue.pages;

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

  @override
  Widget build(BuildContext context) {
    setContext(context);
    return SafeArea(
      child: Scaffold(
        appBar: responsive<PreferredSizeWidget?>(
          null,
          null,
          AppBar(
            title: _title(context),
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
          ),
        ),
        bottomNavigationBar:
            responsive<Widget?>(_bottomNavigation(), _bottomNavigation(), null),
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

  Widget _title(BuildContext cxt) {
    final txt = Theme.of(cxt).textTheme;
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

  Widget _bottomNavigation() {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          Expanded(child: _title(context)),
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: const ThemeToggle(),
          ),
          Header(
            horizontal: false,
            onTap: (index) {
              pageController.animateToPage(index,
                  duration: fast, curve: Curves.easeInOut);
            },
          )
        ],
      ),
    );
  }
}
