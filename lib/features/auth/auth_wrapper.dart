import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'auth_page.dart';
import 'auth_vm.dart';

@RoutePage()
class AuthWrapper extends StatelessWidget {
  final Function()? onSuccess;

  const AuthWrapper({super.key, this.onSuccess});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AuthViewModel>(
      create: (_) => AuthViewModel(onSuccess: onSuccess),
      child: const AuthPage(),
    );
  }
}
