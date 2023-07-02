import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/screen_size.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/features/homepage/socials.dart';
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
      height: screenHeight(),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding * 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello,\nI'm Chandrashekhar",
                    style: txt.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "DevOps Engineer",
                    style: txt.titleLarge!.copyWith(
                      height: 3,
                    ),
                  ),
                  Text(
                    "Hiring prioritize lift sexy productive ocean bake stand. Knowledge three is harvest 4-blocker can't or. Eco-system minimize cadence also buy-in. Open nail invite nail dive. Meat angel say both conversation conversation closer teeth usabiltiy.",
                    style: txt.titleMedium!.copyWith(height: 2),
                  ),
                  heightBox(30),
                  Text("Find me on", style: txt.titleLarge),
                  heightBox(20),
                  Row(
                    children: List.generate(
                      socials.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: defaultPadding),
                        child: Social(svgPath: socials[index]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Flexible(child: Column())
        ],
      ),
    );
  }
}
