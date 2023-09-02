import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common_widgets/snack_bar.dart';
import 'package:portfolio/src/provider/contact_provider.dart';
import 'package:portfolio/src/utils/global_context.dart';
import 'package:portfolio/theme/theme_constant.dart';
import 'package:provider/provider.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.formKey,
    required this.formData,
  });

  final GlobalKey<FormState> formKey;
  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          for (String k in formData.keys) {
            if (formData[k]!.trim().isEmpty) {
              showSnackBar(
                context: context,
                message: "$k is required",
                trailing: const Icon(CupertinoIcons.exclamationmark),
                backgroundColor: snackBarFailed,
              );
              return;
            }
          }
          final successful =
              await context.read<ContactProvider>().sendResponse(formData);

          if (successful) {
            showSnackBar(
              context: mainContext!,
              message: "Sent",
              trailing: const Icon(Icons.check),
              backgroundColor: snackBarSuccess,
            );
          } else {
            showSnackBar(
              context: mainContext!,
              message: "Failed",
              trailing: const Icon(
                CupertinoIcons.exclamationmark,
                size: 16,
              ),
              backgroundColor: snackBarFailed,
            );
          }
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
