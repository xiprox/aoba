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

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeWrapper());
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: AuthWrapper(key: args.key, onSuccess: args.onSuccess));
    },
    RedirectRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<RedirectRouteArgs>(
          orElse: () =>
              RedirectRouteArgs(token: queryParams.optString('access_token')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: RedirectWrapper(key: args.key, token: args.token));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(AuthRoute.name, path: '/login'),
        RouteConfig(RedirectRoute.name, path: '/redirect')
      ];
}

/// generated route for
/// [HomeWrapper]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [AuthWrapper]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({Key? key, dynamic Function()? onSuccess})
      : super(AuthRoute.name,
            path: '/login',
            args: AuthRouteArgs(key: key, onSuccess: onSuccess));

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key, this.onSuccess});

  final Key? key;

  final dynamic Function()? onSuccess;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [RedirectWrapper]
class RedirectRoute extends PageRouteInfo<RedirectRouteArgs> {
  RedirectRoute({Key? key, String? token})
      : super(RedirectRoute.name,
            path: '/redirect',
            args: RedirectRouteArgs(key: key, token: token),
            rawQueryParams: {'access_token': token});

  static const String name = 'RedirectRoute';
}

class RedirectRouteArgs {
  const RedirectRouteArgs({this.key, this.token});

  final Key? key;

  final String? token;

  @override
  String toString() {
    return 'RedirectRouteArgs{key: $key, token: $token}';
  }
}
