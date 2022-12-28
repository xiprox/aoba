import 'package:aoba/features/lists/lists_wrapper.dart';
import 'package:aoba/features/profile/profile_wrapper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import 'package:aoba/navigation/guards/auth_guard.dart';

import 'package:aoba/features/auth/auth_wrapper.dart';
import 'package:aoba/features/home/home_wrapper.dart';
import 'package:aoba/features/redirect/redirect_wrapper.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Wrapper,Route',
  routes: [
    AutoRoute(
      initial: true,
      path: '/',
      guards: [AuthGuard],
      page: HomeWrapper,
    ),
    AutoRoute(
      path: '/login',
      page: AuthWrapper,
    ),
    AutoRoute(
      path: '/profile/:id',
      page: ProfileWrapper,
    ),
    AutoRoute(
      path: '/lists/:userId',
      page: ListsWrapper,
    ),
    AutoRoute(
      path: '/redirect',
      page: RedirectWrapper,
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
