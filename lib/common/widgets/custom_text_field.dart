import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.hidden = false,
    this.hint = "",
    this.padded = true,
    this.border = true,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hint;
  final bool hidden;
  final bool padded;
  final bool border;
  final TextEditingController controller;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padded ? $styles.insets.sm : 0),
      child: TextField(
        controller: controller,
        obscureText: hidden,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: border ? $styles.colors.black : Colors.transparent,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: border ? $styles.colors.black : Colors.transparent,
          )),
        ),
      ),
    );
  }
}
