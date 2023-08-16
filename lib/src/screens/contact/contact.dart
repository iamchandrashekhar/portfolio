import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/responsive_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/contact/contact_details.dart';
import 'package:portfolio/src/screens/contact/contact_form.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveValues<double>(
          defaultPadding * 2,
          defaultPadding * 2.5,
          defaultPadding * 3,
        ),
      ),
      constraints: BoxConstraints(minHeight: 90.h),
      child: const ResponsiveWidget(
        mobile: _MobileAndTablet(),
        tablet: _MobileAndTablet(),
        desktop: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ContactDetails(
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: ContactForm(),
            )
          ],
        ),
      ),
    );
  }
}

class _MobileAndTablet extends StatelessWidget {
  const _MobileAndTablet();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        heightBox(40),
        const ContactDetails(
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        heightBox(40),
        const ContactForm()
      ],
    );
  }
}
