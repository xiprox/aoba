import 'package:aoba/services/services.dart';
import 'package:aoba/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = get<AppRouter>();
    return MaterialApp.router(
      title: 'Aoba',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
