import 'package:dots_indicator/dots_indicator.dart';
import 'package:finner/common/widgets/custom_button.dart';
import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalkthroughPage extends HookWidget {
  const WalkthroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final pageController = usePageController();
    final p = useState(0.0);
    pageController.addListener((() {
      p.value = pageController.page ?? 0.0;
    }));
    return Column(
      children: [
        _imageSection(context, p.value),
        SizedBox(height: $styles.insets.sm),
        _pageView(pageController),
        _dotsIndicator(p),
        SizedBox(height: $styles.insets.sm),
        CustomButton(onTap: () {}, title: "Get Started"),
      ],
    );
  }

  Widget _imageSection(BuildContext context, double pageValue) {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 3,
      width: double.maxFinite,
      color: $styles.colors.accent3,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: $styles.colors.black, shape: BoxShape.circle),
          child: Container(
            width: 190,
            height: 190,
            decoration: BoxDecoration(
                color: $styles.colors.accent2, shape: BoxShape.circle),
            child: Icon(
              pageValue < 0.5
                  ? FontAwesomeIcons.coins
                  : pageValue < 1.5
                      ? FontAwesomeIcons.store
                      : FontAwesomeIcons.chartLine,
              size: Curves.easeIn.transform(pageValue < 0.5
                      ? (0.5 - pageValue)
                      : pageValue < 1.0
                          ? (pageValue - 0.5)
                          : pageValue < 1.5
                              ? (1.5 - pageValue)
                              : (pageValue - 1.5)) *
                  200,
            ),
          ),
        ),
      ),
    );
  }

  Widget _pageView(PageController controller) {
    return SizedBox(
      height: 130,
      child: PageView(
        controller: controller,
        children: List.generate(3, (index) => _page(index)),
      ),
    );
  }

  Widget _page(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.xs),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            indexToTitle(index),
            textAlign: TextAlign.center,
            style: $styles.text.h3,
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                child: Text(
                  indexToDescription(index),
                  textAlign: TextAlign.center,
                  style: $styles.text.body,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String indexToTitle(int index) {
    switch (index) {
      case 0:
        return "Plan your monthly budget";
      case 1:
        return "Save and manage spendings";
      case 2:
        return "Check saving progress";
      default:
        return "";
    }
  }

  String indexToDescription(int index) {
    switch (index) {
      case 0:
        return "Establish monthly spending limits for various categories.";
      case 1:
        return "Enter recent purchases and keep track of your receipts in one location.";
      case 2:
        return "Analyze your spending in relation to prior months and follow the progress of your savings goals.";
      default:
        return "";
    }
  }

  DotsIndicator _dotsIndicator(ValueNotifier<double> p) {
    return DotsIndicator(
      dotsCount: 3,
      position: p.value,
      decorator: DotsDecorator(
        color: $styles.colors.black,
        activeColor: $styles.colors.accent1,
      ),
    );
  }
}
