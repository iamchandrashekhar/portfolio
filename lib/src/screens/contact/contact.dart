import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/common_widgets/spacer.dart';
import 'package:portfolio/src/models/image_model.dart';
import 'package:portfolio/src/utils/responsive.dart';
import 'package:portfolio/src/utils/values.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 90.h),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveValues<double>(
            defaultPadding * 2,
            defaultPadding * 2.5,
            defaultPadding * 3,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ContactDetails(details: AppValue.contactDetails),
                ],
              ),
            ),
            Expanded(
              child: Form(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: () {
        if (!formKey.currentState!.validate()) {
          //sending response to api
          // show snackbar according to status code
          // if Success
          // showSnackBar(
          //   context: context,
          //   message: "Sent",
          //   trailing: const Icon(Icons.check),
          //   backgroundColor: snackBarSuccess,
          // );
          // if failed
          // showSnackBar(
          //   context: context,
          //   message: "Failed",
          //   trailing: const Icon(
          //     CupertinoIcons.exclamationmark,
          //     size: 16,
          //   ),
          //   backgroundColor: snackBarFailed,
          // );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Send",
            style: txt.titleMedium!.copyWith(color: Colors.white),
          ),
          const Icon(Icons.send_outlined)
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key, required this.details});
  final List<ImageModel> details;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: details.length,
      itemBuilder: (context, index) => Row(
        children: [
          SvgPicture.asset(details[index].svgSource),
          widthBox(defaultPadding),
          Text(
            details[index].title ?? "",
            style: txt.titleMedium,
          )
        ],
      ),
    );
  }
}

Widget getTextField(BuildContext context,
    {int maxLines = 1,
    int minLines = 1,
    required String hintText,
    bool isEmail = false}) {
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
