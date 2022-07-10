import 'package:aoba/services/services.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  final _credentials = get<Credentials>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = _credentials.isAuthenticated;
    log('[AuthGuard] isAuthenticated: $isAuthenticated');
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.push(AuthRoute(onSuccess: () => resolver.next(true)));
    }
  }
}
