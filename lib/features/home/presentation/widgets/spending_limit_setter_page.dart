import 'package:finner/common/widgets/custom_button.dart';
import 'package:finner/common/widgets/custom_text_field.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:finner/utils/injectable.dart';
import 'package:finner/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/widgets/custom_snack_bar.dart';
import '../blocs/home_page_bloc/home_page_bloc.dart';

class SpendingLimitSetterPage extends HookWidget {
  const SpendingLimitSetterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: $styles.colors.greyBackground,
        elevation: 0,
        leadingWidth: $styles.insets.xxl,
        title: Text(
          "Monthly Limit",
          style: $styles.text.h3.copyWith(height: 1),
        ),
        leading: GestureDetector(
          onTap: () {
            getIt<FinnerRouter>().pop();
          },
          child: Container(
            width: $styles.insets.sm,
            margin: EdgeInsets.only(left: $styles.insets.sm),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: $styles.colors.greyMedium,
                width: 0.5,
              ),
            ),
            alignment: const Alignment(-0.1, 0),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: $styles.colors.black,
              size: 24,
            ),
          ),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final controller = useTextEditingController();
    return ListView(
      children: [
        Container(
          color: $styles.colors.greyBackground,
          padding: EdgeInsets.symmetric(
            vertical: $styles.insets.md,
            horizontal: $styles.insets.sm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _icon(context),
              SizedBox(height: $styles.insets.md),
              _pageDescription(),
              SizedBox(height: $styles.insets.xs),
              _currentMonth(),
              SizedBox(height: $styles.insets.xs),
              _lastMonthLimit(),
              SizedBox(height: $styles.insets.md),
              _limitTitle(),
              SizedBox(height: $styles.insets.xs),
              _limitInput(controller),
              SizedBox(height: $styles.insets.xs),
            ],
          ),
        ),
        SizedBox(height: $styles.insets.large),
        CustomButton(
            onTap: () {
              try {
                getIt<HomePageBloc>()
                    .add(HomePageEvent.setLimit(double.parse(controller.text)));
                getIt<FinnerRouter>().pop();
              } catch (e) {
                CustomSnackBar.show(
                    "Something went wrong. Check if values are valid.",
                    context);
              }
            },
            title: "Set limit"),
        SizedBox(height: $styles.insets.xl),
      ],
    );
  }

  Center _icon(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        padding: EdgeInsets.all($styles.insets.md),
        decoration: BoxDecoration(
          color: $styles.colors.accent2,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.calendar_month,
          size: $styles.insets.offset,
          color: $styles.colors.black,
        ),
      ),
    );
  }

  Text _pageDescription() {
    return Text(
      "Manage how you spend your money each month by setting a monthly budget.",
      style: $styles.text.title1,
      textAlign: TextAlign.left,
    );
  }

  Row _currentMonth() {
    return Row(children: [
      Text(
        "Current month: ",
        style: $styles.text.title1,
      ),
      Text(
        "${DateTime.now().month}-${DateTime.now().year}",
        style: $styles.text.bodyBold,
      ),
    ]);
  }

  Row _lastMonthLimit() {
    return Row(children: [
      Text(
        "Last month limit: ",
        style: $styles.text.title1,
      ),
      Text(
        "200.00",
        style: $styles.text.bodyBold,
      ),
    ]);
  }

  Text _limitTitle() {
    return Text(
      "Set spending limit",
      style: $styles.text.h4,
    );
  }

  Container _limitInput(TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(color: $styles.colors.white),
      child: CustomTextField(
        controller: controller,
        padded: false,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
