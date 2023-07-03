import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/screen_size.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/homepage/socials.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    List<String> socials = [
      "assets/images/socials/github.svg",
      "assets/images/socials/email.svg",
      "assets/images/socials/linkedin.svg",
      "assets/images/socials/telegram.svg"
    ];
    return SizedBox(
      width: screenWidth(),
      child: responsive<Widget>(
        mobileAndTablet(txt),
        mobileAndTablet(txt),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: introList(textAlign: TextAlign.left, txt: txt),
                ),
              ),
            ),
            const Expanded(child: Column())
          ],
        ),
      ),
    );
  }
}

List<Widget> introList({required TextAlign textAlign, required TextTheme txt}) {
  final socials = AppValue.social;
  return [
    Text(
      AppValue.hello,
      style: txt.displayMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    ),
    Text(
      AppValue.designation,
      style: txt.titleLarge!.copyWith(
        height: 3,
      ),
    ),
    Text(
      AppValue.about,
      style: txt.titleMedium!.copyWith(height: 2),
      textAlign: textAlign,
    ),
    heightBox(30),
    Text("Find me on", style: txt.titleLarge),
    heightBox(20),
    Wrap(
      children: List.generate(
        socials.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: defaultPadding),
          child: Social(svgPath: socials[index].svgPath),
        ),
      ),
    )
  ];
}

Widget mobileAndTablet(TextTheme txt) {
  return Column(
    children: [
      heightBox(defaultPadding * 3),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: introList(textAlign: TextAlign.center, txt: txt),
        ),
      ),
    ],
  );
}
