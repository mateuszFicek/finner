import 'package:flutter/material.dart';

import '../../../../common/widgets/quick_action_button.dart';
import '../../../../styles/theme_utils.dart';

class SpendingContainer extends StatelessWidget {
  final SpendingType? spendingType;
  final String title;
  final double amount;
  const SpendingContainer({
    required this.amount,
    required this.title,
    this.spendingType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: $styles.insets.xxl,
      decoration: BoxDecoration(
        color: $styles.colors.greyBackground.withOpacity(0.75),
        borderRadius: BorderRadius.circular(
          $styles.insets.xs,
        ),
      ),
      padding: EdgeInsets.all($styles.insets.xs),
      child: Row(
        children: [
          Container(
            width: $styles.insets.xl,
            height: $styles.insets.xl,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: spendingType?.color ??
                  $styles.colors.accent2.withOpacity(0.15),
            ),
            child: Icon(
              Icons.wallet,
              color: $styles.colors.greyStrong,
            ),
          ),
          SizedBox(width: $styles.insets.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: $styles.text.h4,
              ),
              Text(
                spendingType?.name ?? "Spending",
                style: $styles.text.bodySmall.copyWith(height: 1),
              ),
            ],
          ),
          const Spacer(),
          Text("PLN $amount")
        ],
      ),
    );
  }
}
