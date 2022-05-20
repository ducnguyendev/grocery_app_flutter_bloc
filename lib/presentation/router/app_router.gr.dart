// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i6;

import '../page/home/home_screen.dart' as _i4;
import '../page/navigation_page.dart' as _i1;
import '../page/profile/profile_page.dart' as _i3;
import '../page/ratings/ratings_page.dart' as _i5;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    NavigationPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NavigationPage());
    },
    PortfolioPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    RatingsPageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ProfilePageRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ProfilePage());
    },
    HomeScreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HomeScreen());
    },
    RatingsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.RatingsPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/',
            redirectTo: 'presentation/navigation_page',
            fullMatch: true),
        _i2.RouteConfig(NavigationPageRouter.name,
            path: 'presentation/navigation_page',
            children: [
              _i2.RouteConfig(PortfolioPageRouter.name,
                  path: 'presentation/page/portfolio/portfolio_page',
                  parent: NavigationPageRouter.name,
                  children: [
                    _i2.RouteConfig(HomeScreen.name,
                        path: '', parent: PortfolioPageRouter.name)
                  ]),
              _i2.RouteConfig(RatingsPageRouter.name,
                  path: 'presentation/page/ratings/ratings_page',
                  parent: NavigationPageRouter.name,
                  children: [
                    _i2.RouteConfig(RatingsRoute.name,
                        path: '', parent: RatingsPageRouter.name)
                  ]),
              _i2.RouteConfig(ProfilePageRouter.name,
                  path: 'presentation/page/profile/profile_page',
                  parent: NavigationPageRouter.name)
            ])
      ];
}

/// generated route for
/// [_i1.NavigationPage]
class NavigationPageRouter extends _i2.PageRouteInfo<void> {
  const NavigationPageRouter({List<_i2.PageRouteInfo>? children})
      : super(NavigationPageRouter.name,
            path: 'presentation/navigation_page', initialChildren: children);

  static const String name = 'NavigationPageRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PortfolioPageRouter extends _i2.PageRouteInfo<void> {
  const PortfolioPageRouter({List<_i2.PageRouteInfo>? children})
      : super(PortfolioPageRouter.name,
            path: 'presentation/page/portfolio/portfolio_page',
            initialChildren: children);

  static const String name = 'PortfolioPageRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class RatingsPageRouter extends _i2.PageRouteInfo<void> {
  const RatingsPageRouter({List<_i2.PageRouteInfo>? children})
      : super(RatingsPageRouter.name,
            path: 'presentation/page/ratings/ratings_page',
            initialChildren: children);

  static const String name = 'RatingsPageRouter';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfilePageRouter extends _i2.PageRouteInfo<void> {
  const ProfilePageRouter()
      : super(ProfilePageRouter.name,
            path: 'presentation/page/profile/profile_page');

  static const String name = 'ProfilePageRouter';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i2.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.RatingsPage]
class RatingsRoute extends _i2.PageRouteInfo<void> {
  const RatingsRoute() : super(RatingsRoute.name, path: '');

  static const String name = 'RatingsRoute';
}
