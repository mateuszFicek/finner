import 'package:finner/common/widgets/bar_chart.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/widgets/quick_action_button.dart';
import '../widgets/spending_container.dart';
import '../widgets/user_information.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _firstPage(context);
  }

  ListView _firstPage(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 450,
          child: Stack(
            children: [
              _userInformationSection(context),
              _spendingChart(context),
            ],
          ),
        ),
        _quickActions(context),
        SizedBox(height: $styles.insets.sm),
        _latestSpendings(context),
      ],
    );
  }

  Widget _userInformationSection(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.fromLTRB(
        $styles.insets.md,
        MediaQuery.of(context).padding.top + $styles.insets.md,
        $styles.insets.md,
        0,
      ),
      width: double.maxFinite,
      color: $styles.colors.black,
      child: const IntrinsicHeight(
        child: UserInformation(),
      ),
    );
  }

  Widget _spendingChart(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200,
        width: double.maxFinite,
        margin: EdgeInsets.all($styles.insets.md),
        padding: EdgeInsets.only(
          top: $styles.insets.md,
          left: $styles.insets.md,
          right: $styles.insets.sm,
        ),
        decoration: BoxDecoration(
          color: $styles.colors.greyBackground,
          borderRadius: BorderRadius.circular(
            $styles.corners.sm,
          ),
        ),
        child: const CustomBarChart(),
      ),
    );
  }

  Widget _latestSpendings(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        $styles.insets.md,
        0,
        $styles.insets.md,
        $styles.insets.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest activity",
            style: $styles.text.h3,
          ),
          SizedBox(
            height: $styles.insets.md,
          ),
          ...List.generate(2, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: $styles.insets.sm),
              child: SpendingContainer(
                amount: index * 112.42,
                title: 'Title',
                spendingType: SpendingType.ALL.quickActions[index],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _quickActions(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: SpendingType.ALL.quickActions
            .map((e) => QuickActionButton(quickAction: e))
            .toList(),
      ),
    );
  }
}
