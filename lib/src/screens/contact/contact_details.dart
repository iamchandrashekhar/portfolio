import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/image_widget.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/models/image_model.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:url_launcher/link.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key, required this.crossAxisAlignment});
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          AppValue.contactMe,
          style: txt.displayLarge!.copyWith(
            color: theme.colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          AppValue.getInTouch,
          style: txt.titleLarge!.copyWith(
            color: txt.bodyLarge!.color!.withOpacity(0.5),
            fontWeight: FontWeight.normal,
          ),
        ),
        heightBox(20),
        ContactCard(details: AppValue.contactDetails),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.details});
  final List<ImageModel> details;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: details.length,
      itemBuilder: (context, index) {
        late Uri uri;
        if (RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
            .hasMatch(details[index].link!)) {
          uri = Uri(scheme: "mailto", path: details[index].link!);
        } else {
          uri = Uri(scheme: "https", path: details[index].link!);
        }

        return Link(
          uri: uri,
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: followLink,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(details[index].svgSource),
                    widthBox(defaultPadding),
                    Text(
                      (details[index].title ?? ""),
                      style: txt.titleMedium,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
