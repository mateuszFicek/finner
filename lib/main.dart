import 'package:flutter/material.dart';

import 'styles/theme_utils.dart';
import 'utils/injectable.dart';
import 'utils/router.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = getIt<FinnerRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finner app',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: $styles.colors.toThemeData(),
    );
  }
}
