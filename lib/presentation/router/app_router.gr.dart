// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i9;

import '../page/home/home_screen.dart' as _i7;
import '../page/login/login_screen.dart' as _i2;
import '../page/navigation_page.dart' as _i4;
import '../page/profile/profile_page.dart' as _i6;
import '../page/ratings/ratings_page.dart' as _i8;
import '../page/signup/signup_screen.dart' as _i3;
import '../page/welcome/welcome_screen.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    WelcomePageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.WelcomeScreen());
    },
    LoginPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    SignupPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignUpScreen());
    },
    NavigationPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NavigationPage());
    },
    PortfolioPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    RatingsPageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ProfilePageRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ProfilePage());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.HomeScreen());
    },
    RatingsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.RatingsPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/',
            redirectTo: 'presentation/welcome_screen',
            fullMatch: true),
        _i5.RouteConfig(WelcomePageRouter.name,
            path: 'presentation/welcome_screen'),
        _i5.RouteConfig(LoginPageRouter.name,
            path: 'presentation/login_screen'),
        _i5.RouteConfig(SignupPageRouter.name,
            path: 'presentation/signup_screen'),
        _i5.RouteConfig(NavigationPageRouter.name,
            path: 'presentation/navigation_page',
            children: [
              _i5.RouteConfig(PortfolioPageRouter.name,
                  path: 'presentation/page/portfolio/portfolio_page',
                  parent: NavigationPageRouter.name,
                  children: [
                    _i5.RouteConfig(HomeScreen.name,
                        path: '', parent: PortfolioPageRouter.name)
                  ]),
              _i5.RouteConfig(RatingsPageRouter.name,
                  path: 'presentation/page/ratings/ratings_page',
                  parent: NavigationPageRouter.name,
                  children: [
                    _i5.RouteConfig(RatingsRoute.name,
                        path: '', parent: RatingsPageRouter.name)
                  ]),
              _i5.RouteConfig(ProfilePageRouter.name,
                  path: 'presentation/page/profile/profile_page',
                  parent: NavigationPageRouter.name)
            ])
      ];
}

/// generated route for
/// [_i1.WelcomeScreen]
class WelcomePageRouter extends _i5.PageRouteInfo<void> {
  const WelcomePageRouter()
      : super(WelcomePageRouter.name, path: 'presentation/welcome_screen');

  static const String name = 'WelcomePageRouter';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginPageRouter extends _i5.PageRouteInfo<void> {
  const LoginPageRouter()
      : super(LoginPageRouter.name, path: 'presentation/login_screen');

  static const String name = 'LoginPageRouter';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignupPageRouter extends _i5.PageRouteInfo<void> {
  const SignupPageRouter()
      : super(SignupPageRouter.name, path: 'presentation/signup_screen');

  static const String name = 'SignupPageRouter';
}

/// generated route for
/// [_i4.NavigationPage]
class NavigationPageRouter extends _i5.PageRouteInfo<void> {
  const NavigationPageRouter({List<_i5.PageRouteInfo>? children})
      : super(NavigationPageRouter.name,
            path: 'presentation/navigation_page', initialChildren: children);

  static const String name = 'NavigationPageRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class PortfolioPageRouter extends _i5.PageRouteInfo<void> {
  const PortfolioPageRouter({List<_i5.PageRouteInfo>? children})
      : super(PortfolioPageRouter.name,
            path: 'presentation/page/portfolio/portfolio_page',
            initialChildren: children);

  static const String name = 'PortfolioPageRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class RatingsPageRouter extends _i5.PageRouteInfo<void> {
  const RatingsPageRouter({List<_i5.PageRouteInfo>? children})
      : super(RatingsPageRouter.name,
            path: 'presentation/page/ratings/ratings_page',
            initialChildren: children);

  static const String name = 'RatingsPageRouter';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfilePageRouter extends _i5.PageRouteInfo<void> {
  const ProfilePageRouter()
      : super(ProfilePageRouter.name,
            path: 'presentation/page/profile/profile_page');

  static const String name = 'ProfilePageRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i8.RatingsPage]
class RatingsRoute extends _i5.PageRouteInfo<void> {
  const RatingsRoute() : super(RatingsRoute.name, path: '');

  static const String name = 'RatingsRoute';
}
