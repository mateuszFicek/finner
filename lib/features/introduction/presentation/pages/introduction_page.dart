import 'package:finner/styles/theme_utils.dart';
import 'package:finner/utils/injectable.dart';
import 'package:finner/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app_modules/app_settings_cubit/app_settings_cubit.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  bool firstStepFinished = false;
  bool animationsFinished = false;
  List<bool> featureAnimations = List.generate(4, (index) => false);
  final _bloc = getIt<AppSettingsCubit>();

  @override
  void initState() {
    super.initState();
    if (_bloc.state is DisplayedIntroductionState) {
      getIt<FinnerRouter>().replace(const SignInRoute());
      return;
    }
    Future.delayed($styles.times.med, () {
      setState(() {
        firstStepFinished = true;
      });
      Stream<int>.periodic($styles.times.slow, (x) => x)
          .take(featureAnimations.length)
          .forEach((element) {
        setState(() {
          featureAnimations[element] = true;
        });
      }).then((value) => setState(() => animationsFinished = true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: $styles.colors.accent2, body: _body());
  }

  Widget _body() {
    return Center(
      child: Stack(
        children: [
          welcomeText(),
          ...animatedFeatures(),
          continueButton(),
        ],
      ),
    );
  }

  AnimatedPositioned welcomeText() {
    return AnimatedPositioned(
      top:
          firstStepFinished ? 200 : MediaQuery.of(context).size.height / 2 - 40,
      left: 0,
      right: 0,
      curve: Curves.easeInOutCubic,
      duration: $styles.times.med,
      child: Text(
        "Welcome to Finner!",
        style: $styles.text.h1.copyWith(
          color: $styles.colors.offWhite,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  List<AnimatedPositioned> animatedFeatures() {
    return List.generate(
      featureAnimations.length,
      (e) => AnimatedPositioned(
        top: MediaQuery.of(context).size.height / 2 + e * 40,
        left: featureAnimations[e] ? 40 : -MediaQuery.of(context).size.width,
        curve: Curves.easeOutCubic,
        duration: $styles.times.med,
        child: Text(
          indexToFeatureText(e),
          style: $styles.text.h3.copyWith(
            color: $styles.colors.offWhite,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AnimatedPositioned continueButton() {
    return AnimatedPositioned(
      bottom: animationsFinished ? 40 : -100,
      right: 40,
      curve: Curves.easeInOutCubicEmphasized,
      duration: $styles.times.med,
      child: Material(
        color: $styles.colors.accent3,
        borderRadius: BorderRadius.circular(64),
        child: InkWell(
          borderRadius: BorderRadius.circular(64),
          onTap: () {
            _bloc.setIntroductionAsDisplayed();
            getIt<FinnerRouter>().replace(const WalkthroughRoute());
          },
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: $styles.colors.greyStrong,
            ),
          ),
        ),
      ),
    );
  }

  String indexToFeatureText(int index) {
    switch (index) {
      case 0:
        return "· plan your budget";
      case 1:
        return "· manage spendings";
      case 2:
        return "· save money";
      case 3:
        return "· view statistics";
      default:
        return "";
    }
  }
}
