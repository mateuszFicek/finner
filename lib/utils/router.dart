import 'package:auto_route/auto_route.dart';
import 'package:finner/features/account/presentation/pages/sign_in_page.dart';
import 'package:finner/features/home/presentation/widgets/add_spending_widget.dart';
import 'package:finner/features/introduction/presentation/pages/introduction_page.dart';
import 'package:finner/features/introduction/presentation/pages/walkthrough_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../common/widgets/quick_action_button.dart';
import '../features/home/presentation/pages/home.dart';
import '../features/home/presentation/widgets/spending_limit_setter_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: IntroductionPage, initial: true),
    AutoRoute(page: WalkthroughPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: HomeViewPage),
    AutoRoute(page: SpendingLimitSetterPage),
    AutoRoute(page: AddSpendingPage),
  ],
)
@singleton
class FinnerRouter extends _$FinnerRouter {}
