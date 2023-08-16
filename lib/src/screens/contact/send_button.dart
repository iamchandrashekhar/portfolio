import 'package:flutter/material.dart';

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
