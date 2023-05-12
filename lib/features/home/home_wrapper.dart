import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

@RoutePage()
class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
