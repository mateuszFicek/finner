import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';
import 'styles/theme_utils.dart';
import 'utils/injectable.dart';
import 'utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () {
      configureDependencies();
      return runApp(MyApp());
    },
    storage: storage,
  );
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
