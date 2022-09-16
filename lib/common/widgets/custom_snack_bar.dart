import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class CustomSnackBar extends SnackBar {
  final String message;
  CustomSnackBar({super.key, required this.message})
      : super(
          content: Text(
            message,
            style: $styles.text.bodyBold.copyWith(color: $styles.colors.white),
          ),
          backgroundColor: $styles.colors.black,
          duration: const Duration(milliseconds: 2500),
        );

  static show(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(CustomSnackBar(message: message));
  }
}
