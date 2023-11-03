import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'redirect_page.dart';
import 'redirect_vm.dart';

@RoutePage()
class RedirectWrapper extends StatelessWidget {
  final String? token;

  const RedirectWrapper({
    super.key,
    @QueryParam('access_token') this.token,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<RedirectViewModel>(
      create: (_) {
        return RedirectViewModel(token: token);
      },
      child: const RedirectPage(),
    );
  }
}
