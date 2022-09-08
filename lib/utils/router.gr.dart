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
          routeData: routeData, child: const IntroductionPage());
    },
    WalkthroughRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WalkthroughPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(IntroductionRoute.name, path: '/'),
        RouteConfig(WalkthroughRoute.name, path: '/walkthrough-page')
      ];
}

/// generated route for
/// [IntroductionPage]
class IntroductionRoute extends PageRouteInfo<void> {
  const IntroductionRoute() : super(IntroductionRoute.name, path: '/');

  static const String name = 'IntroductionRoute';
}

/// generated route for
/// [WalkthroughPage]
class WalkthroughRoute extends PageRouteInfo<void> {
  const WalkthroughRoute()
      : super(WalkthroughRoute.name, path: '/walkthrough-page');

  static const String name = 'WalkthroughRoute';
}
