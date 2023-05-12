import 'package:aoba/features/lists/lists_wrapper.dart';
import 'package:aoba/features/profile/profile_wrapper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'package:aoba/navigation/guards/auth_guard.dart';

import 'package:aoba/features/auth/auth_wrapper.dart';
import 'package:aoba/features/home/home_wrapper.dart';
import 'package:aoba/features/redirect/redirect_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Wrapper,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      guards: [AuthGuard()],
      page: HomeRoute.page,
    ),
    AutoRoute(
      path: '/login',
      page: AuthRoute.page,
    ),
    AutoRoute(
      path: '/profile/:id',
      page: ProfileRoute.page,
    ),
    AutoRoute(
      path: '/lists/:userId',
      page: ListsRoute.page,
    ),
    AutoRoute(
      path: '/redirect',
      page: RedirectRoute.page,
    ),
  ];
}
