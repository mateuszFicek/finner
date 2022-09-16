import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.hidden = false,
    this.hint = "",
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hint;
  final bool hidden;
  final TextEditingController controller;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: TextField(
        controller: controller,
        obscureText: hidden,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
