import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/screens/contact/send_button.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/theme/theme_constant.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: getTextField(context, hintText: "First Name"),
              ),
              widthBox(20),
              Expanded(
                child: getTextField(context, hintText: "Last Name"),
              ),
            ],
          ),
          heightBox(20),
          getTextField(context, hintText: "Email", isEmail: true),
          heightBox(20),
          getTextField(
            context,
            maxLines: 6,
            minLines: 6,
            hintText: "Message",
          ),
          heightBox(20),
          SizedBox(
            width: 130,
            child: SendButton(formKey: formKey),
          )
        ],
      ),
    );
  }
}

Widget getTextField(
  BuildContext context, {
  int maxLines = 1,
  int minLines = 1,
  required String hintText,
  bool isEmail = false,
}) {
  final theme = Theme.of(context);
  return TextFormField(
    maxLines: maxLines,
    minLines: minLines,
    onChanged: (value) {},
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) => (value ?? "").isEmpty
        ? "Required"
        : isEmail
            ? RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$').hasMatch(value ?? "")
                ? null
                : "Invalid Email"
            : null,
    decoration: InputDecoration(
      filled: true,
      fillColor: theme.colorScheme.onBackground,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.onBackground),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultRadius * 2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: getColor(light: lightGrey, dark: darkGrey)),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultRadius * 2)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.secondary),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultRadius * 2)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.secondary),
        borderRadius:
            const BorderRadius.all(Radius.circular(defaultRadius * 2)),
      ),
      errorStyle: theme.textTheme.bodySmall!
          .copyWith(color: theme.colorScheme.secondary),
      hintText: hintText,
      hintStyle: TextStyle(
        color: getColor(
          light: darkGrey.withOpacity(0.4),
          dark: lightGrey.withOpacity(0.4),
        ),
      ),
      // errorText: "Invalid",
      hoverColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 24, vertical: defaultPadding * 1.5),
    ),
    cursorColor: theme.textTheme.bodyLarge!.color,
  );
}
