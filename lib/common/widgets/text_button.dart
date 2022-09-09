import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.title,
    this.outlined = false,
    this.padded = true,
    this.white = false,
    this.icon,
  });

  final Function() onTap;
  final String title;
  final bool outlined;
  final bool padded;
  final bool white;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padded
          ? EdgeInsets.symmetric(horizontal: $styles.insets.sm)
          : EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular($styles.corners.md),
        child: InkWell(
          onTap: onTap,
          highlightColor: white ? $styles.colors.black : $styles.colors.accent3,
          borderRadius: BorderRadius.circular($styles.corners.md),
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border: outlined
                    ? Border.all(
                        color:
                            white ? $styles.colors.white : $styles.colors.black,
                        width: 1.5,
                      )
                    : null,
                borderRadius: BorderRadius.circular($styles.corners.md)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: $styles.text.btn.copyWith(
                        color:
                            white ? $styles.colors.white : $styles.colors.black,
                        height: 1),
                  ),
                  if (icon != null) const SizedBox(width: 8),
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Icon(
                        icon,
                        color:
                            white ? $styles.colors.white : $styles.colors.black,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
