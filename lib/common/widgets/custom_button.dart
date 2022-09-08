import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
      child: Material(
        color: $styles.colors.black,
        borderRadius: BorderRadius.circular($styles.corners.md),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular($styles.corners.md),
          child: SizedBox(
            width: double.maxFinite,
            height: $styles.insets.xxl,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: $styles.text.btn,
            ),
          ),
        ),
      ),
    );
  }
}
