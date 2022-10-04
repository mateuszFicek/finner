import 'package:flutter/material.dart';

import '../../styles/theme_utils.dart';

class QuickActionButton extends StatelessWidget {
  final SpendingType quickAction;
  const QuickActionButton({
    required this.quickAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: $styles.insets.xxl,
            width: $styles.insets.xxl,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: quickAction.color,
            ),
            child: Icon(Icons.wallet),
          ),
          SizedBox(height: $styles.insets.xxs),
          Text(
            quickAction.name,
            maxLines: 2,
            style: $styles.text.bodyExtraSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

enum SpendingType {
  FOOD,
  HOME,
  TRANSPORT,
  CLOTHING,
  ENTERTAINMENT,
  ALL,
}

extension QuickActionDetails on SpendingType {
  Color get color {
    if (this == SpendingType.FOOD) {
      return $styles.colors.greenSpending;
    }
    if (this == SpendingType.HOME) {
      return $styles.colors.orangeSpending;
    }
    if (this == SpendingType.CLOTHING) {
      return $styles.colors.redSpending;
    }
    if (this == SpendingType.ENTERTAINMENT) {
      return $styles.colors.blueSpending;
    }
    return $styles.colors.blueSpending;
  }

  String get name {
    if (this == SpendingType.FOOD) {
      return "Food";
    }
    if (this == SpendingType.HOME) {
      return "Housing";
    }
    if (this == SpendingType.CLOTHING) {
      return "Clothing";
    }
    if (this == SpendingType.ENTERTAINMENT) {
      return "Entertainment";
    }
    return "";
  }

  List<SpendingType> get quickActions => [
        SpendingType.FOOD,
        SpendingType.HOME,
        SpendingType.ENTERTAINMENT,
        SpendingType.CLOTHING
      ];
}
