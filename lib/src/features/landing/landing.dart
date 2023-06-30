import 'package:flutter/material.dart';
import 'package:portfolio/src/features/contact/contact.dart';
import 'package:portfolio/src/features/homepage/homepage.dart';
import 'package:portfolio/src/features/landing/headers.dart';
import 'package:portfolio/src/features/projects/project.dart';
import 'package:portfolio/src/features/skiils/skills.dart';
import 'package:portfolio/src/provider/landing_provider.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController = PageController(initialPage: 0);

  List<Widget> pages = [
    const HomePage(),
    const Projects(),
    const Skills(),
    const Contact()
  ];

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
    context
        .read<LandingProvider>()
        .updateHeaderIndex((pageController.page ?? 0).toInt());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _title(context),
          actions: [
            GestureDetector(
                onTap: () {
                  context.read<ThemeManager>().toggleTheme();
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Toggle Theme"),
                )),
            HeaderMenu(
              onTap: (index) {
                pageController.animateToPage(index,
                    duration: fast, curve: Curves.easeInOut);
              },
            ),
          ],
        ),
        body: PageView.builder(
          controller: pageController,
          pageSnapping: false,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => pages[index],
          itemCount: pages.length,
        ),
      ),
    );
  }

  Widget _title(BuildContext cxt) {
    final txt = Theme.of(cxt).textTheme;
    return RichText(
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
        style: txt.titleMedium,
      ),
    );
  }
}
