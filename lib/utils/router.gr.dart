// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$FinnerRouter extends RootStackRouter {
  _$FinnerRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    IntroductionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const IntroductionPage(),
      );
    },
    WalkthroughRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WalkthroughPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          IntroductionRoute.name,
          path: '/',
        ),
        RouteConfig(
          WalkthroughRoute.name,
          path: '/walkthrough-page',
        ),
        RouteConfig(
          SignInRoute.name,
          path: '/sign-in-page',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
      ];
}

/// generated route for
/// [IntroductionPage]
class IntroductionRoute extends PageRouteInfo<void> {
  const IntroductionRoute()
      : super(
          IntroductionRoute.name,
          path: '/',
        );

  static const String name = 'IntroductionRoute';
}

/// generated route for
/// [WalkthroughPage]
class WalkthroughRoute extends PageRouteInfo<void> {
  const WalkthroughRoute()
      : super(
          WalkthroughRoute.name,
          path: '/walkthrough-page',
        );

  static const String name = 'WalkthroughRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in-page',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}
