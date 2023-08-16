import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme_constant.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  double? width,
  Widget? trailing,
  Color? backgroundColor,
}) {
  final theme = Theme.of(context);
  final txt = theme.textTheme;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(defaultRadius * 2),
        ),
      ),
      width: 250,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5,
        vertical: defaultPadding,
      ),
      backgroundColor: backgroundColor ?? theme.colorScheme.secondary,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: txt.titleMedium!.copyWith(color: textDarkColor),
          ),
          if (trailing != null) trailing
        ],
      ),
    ),
  );
}
