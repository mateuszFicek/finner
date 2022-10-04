import 'package:auto_route/auto_route.dart';
import 'package:finner/features/account/presentation/pages/sign_in_page.dart';
import 'package:finner/features/introduction/presentation/pages/introduction_page.dart';
import 'package:finner/features/introduction/presentation/pages/walkthrough_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../features/home/presentation/pages/home.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: IntroductionPage, initial: true),
    AutoRoute(page: WalkthroughPage),
    AutoRoute(page: SignInPage),
    AutoRoute(page: HomeViewPage),
  ],
)
@singleton
class FinnerRouter extends _$FinnerRouter {}
