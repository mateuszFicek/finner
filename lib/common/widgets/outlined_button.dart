import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
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
        color: $styles.colors.white,
        borderRadius: BorderRadius.circular($styles.corners.md),
        child: InkWell(
          onTap: onTap,
          highlightColor: $styles.colors.accent3,
          borderRadius: BorderRadius.circular($styles.corners.md),
          child: Container(
            width: double.maxFinite,
            height: $styles.insets.xxl,
            decoration: BoxDecoration(
                border: Border.all(
                  color: $styles.colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular($styles.corners.md)),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: $styles.text.btn
                    .copyWith(color: $styles.colors.black, height: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
