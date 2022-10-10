import 'package:finner/common/extensions/extensions.dart';
import 'package:finner/common/widgets/custom_button.dart';
import 'package:finner/common/widgets/custom_snack_bar.dart';
import 'package:finner/common/widgets/custom_text_field.dart';
import 'package:finner/common/widgets/quick_action_button.dart';
import 'package:finner/common/widgets/text_button.dart';
import 'package:finner/features/home/domain/entities/spending.dart';
import 'package:finner/features/home/presentation/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:finner/utils/injectable.dart';
import 'package:finner/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddSpendingPage extends HookWidget {
  final SpendingType type;
  const AddSpendingPage({super.key, this.type = SpendingType.ALL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: $styles.colors.greyBackground,
        elevation: 0,
        leadingWidth: $styles.insets.xxl,
        title: Text(
          "New spending",
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
    final amountController = useTextEditingController();
    final titleController = useTextEditingController();
    final spendingType = useState(type);

    var date = useState(DateTime.now());

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
              _icon(context, spendingType),
              SizedBox(height: $styles.insets.md),
              _pageDescription(),
              SizedBox(height: $styles.insets.xs),
              _title("Amount"),
              SizedBox(height: $styles.insets.xs),
              _limitInput(amountController, true),
              SizedBox(height: $styles.insets.sm),
              _title("Title"),
              SizedBox(height: $styles.insets.xs),
              _limitInput(titleController),
              SizedBox(height: $styles.insets.sm),
              _title("Date"),
              SizedBox(height: $styles.insets.xs),
              _dateSelector(context, date),
              SizedBox(height: $styles.insets.xs),
            ],
          ),
        ),
        SizedBox(height: $styles.insets.md),
        CustomButton(
            onTap: () {
              try {
                final doubleAmount = amountController.text.replaceAll(",", ".");
                final s = Spending(
                  amount: double.parse(doubleAmount),
                  date: date.value,
                  title: titleController.text,
                  type: spendingType.value.name,
                );
                getIt<HomePageBloc>().add(HomePageEvent.addSpending(s));
              } catch (e) {
                CustomSnackBar.show(
                    "Something went wrong. Check if values are valid.",
                    context);
              }
            },
            title: "Submit spending"),
        SizedBox(height: $styles.insets.xl),
      ],
    );
  }

  Center _icon(BuildContext context, ValueNotifier<SpendingType> type) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: $styles.colors.greyBackground,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 4 +
                  MediaQuery.of(context).padding.bottom +
                  $styles.insets.xxl,
            ),
            context: context,
            builder: (context) => ListView(
              padding: EdgeInsets.only(top: $styles.insets.sm),
              children: SpendingType.values
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        type.value = e;
                        getIt<FinnerRouter>().pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: $styles.insets.xs,
                            horizontal: $styles.insets.md),
                        child: Row(
                          children: [
                            Icon(e.icon),
                            SizedBox(width: $styles.insets.md),
                            Text(e.name),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 12,
                  left: MediaQuery.of(context).size.height / 12,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: $styles.colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all($styles.insets.xs),
                  child: Icon(
                    Icons.edit,
                    size: $styles.insets.sm,
                    color: $styles.colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                padding: EdgeInsets.all($styles.insets.md),
                decoration: BoxDecoration(
                  color: type.value.color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  type.value.icon,
                  size: $styles.insets.xxl,
                  color: $styles.colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _pageDescription() {
    return Text(
      "Enter the details of your purchase, and it will be deducted from your monthly spending cap and added to your monthly spending total.",
      style: $styles.text.title1,
      textAlign: TextAlign.left,
    );
  }

  Text _title(String title) {
    return Text(
      title,
      style: $styles.text.h4,
    );
  }

  Container _limitInput(
    TextEditingController controller, [
    bool isNumberInput = false,
  ]) {
    return Container(
      decoration: BoxDecoration(color: $styles.colors.white),
      child: CustomTextField(
        controller: controller,
        padded: false,
        keyboardType: isNumberInput
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.name,
      ),
    );
  }

  Container _dateSelector(BuildContext context, ValueNotifier<DateTime> date) {
    final selectedDate = useState(DateTime.now());
    return Container(
      decoration: BoxDecoration(color: $styles.colors.white),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 3,
            ),
            builder: (_) => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.all($styles.insets.sm),
                decoration: BoxDecoration(
                  color: $styles.colors.greyBackground,
                  borderRadius: BorderRadius.circular(
                    $styles.insets.xs,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: $styles.insets.large,
                      height: 40,
                      child: CustomTextButton(
                        onTap: () {
                          date.value = selectedDate.value;
                          getIt<FinnerRouter>().pop();
                        },
                        title: "Set date",
                        padded: true,
                        centered: true,
                        outlined: true,
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (dateValue) {
                          selectedDate.value = dateValue;
                        },
                        initialDateTime: selectedDate.value,
                        mode: CupertinoDatePickerMode.date,
                        maximumDate: DateTime.now().add(
                          const Duration(minutes: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: AbsorbPointer(
          absorbing: true,
          child: CustomTextField(
            controller: TextEditingController(
                text: selectedDate.value.fullDateWithoutTime),
            padded: false,
            keyboardType: TextInputType.number,
          ),
        ),
      ),
    );
  }
}
