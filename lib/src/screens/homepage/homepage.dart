import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/homepage/image_stack.dart';
import 'package:portfolio/src/screens/homepage/socials.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100.h),
      child: ResponsiveWidget(
        mobile: const MobileAndTablet(),
        tablet: const MobileAndTablet(),
        desktop: Row(
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
            const Expanded(child: ImageStack())
          ],
        ),
      ),
    );
  }
}

List<Widget> introList({required TextAlign textAlign, required TextTheme txt}) {
  final socials = AppValue.social;
  return [
    Stack(
      children: [
        Text(
          AppValue.hello,
          style: txt.displayMedium!
              .copyWith(fontWeight: FontWeight.bold, color: transparent),
          textAlign: textAlign,
        ),
        DefaultTextStyle(
          style: txt.displayMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: textAlign,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(AppValue.hello,
                  speed: fastest, textAlign: textAlign)
            ],
          ),
        ),
      ],
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
          padding: EdgeInsets.all(defaultPadding).copyWith(left: 0),
          child: Social(svgPath: socials[index].svgPath),
        ),
      ),
    )
  ];
}

class MobileAndTablet extends StatelessWidget {
  const MobileAndTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
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
}
