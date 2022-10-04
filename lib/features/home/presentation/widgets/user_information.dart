import 'package:flutter/material.dart';

import '../../../../styles/theme_utils.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: $styles.insets.md,
              backgroundColor: $styles.colors.accent1,
            ),
            SizedBox(width: $styles.insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome!",
                  style: $styles.text.contentFont
                      .copyWith(color: $styles.colors.white),
                ),
                Text(
                  "Mateusz Ficek",
                  style: $styles.text.h3.copyWith(color: $styles.colors.white),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: $styles.insets.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: $styles.insets.xl,
              width: $styles.insets.xl,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
              child: Center(
                child: Icon(
                  Icons.info_outline,
                  color: $styles.colors.offWhite,
                ),
              ),
            ),
            SizedBox(width: $styles.insets.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Spending limit",
                  style: $styles.text.contentFont
                      .copyWith(color: $styles.colors.white),
                ),
                Text(
                  "PLN 400.00",
                  style: $styles.text.h3.copyWith(color: $styles.colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
