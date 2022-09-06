import 'package:finner/styles/theme_utils.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $styles.colors.accent2,
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Text(
        "Welcome to Finner!",
        style: $styles.text.h1.copyWith(
          color: $styles.colors.offWhite,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
