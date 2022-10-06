import 'package:finner/common/extensions/date_extensions.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/quick_action_button.dart';
import '../../../../styles/theme_utils.dart';

class SpendingContainer extends StatelessWidget {
  final Spending spending;
  const SpendingContainer({
    required this.spending,
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
              color: spending.spendingType.color,
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
                spending.title,
                style: $styles.text.h4,
              ),
              Row(
                children: [
                  Text(
                    spending.spendingType.name,
                    style: $styles.text.bodySmall.copyWith(height: 1),
                  ),
                  Text(
                    " - ",
                    style: $styles.text.bodySmall.copyWith(height: 1),
                  ),
                  Text(
                    spending.date.fullDateWithTime,
                    style: $styles.text.bodySmall.copyWith(height: 1),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(spending.amount.toStringAsFixed(2))
        ],
      ),
    );
  }
}
