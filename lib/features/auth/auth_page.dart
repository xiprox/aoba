import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'auth_vm.dart';

class AuthPage extends ViewModelWidget<AuthViewModel> {
  const AuthPage({super.key});

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    AuthViewModel vm,
  ) {
    if (order is MoveOn) {
      vm.onSuccess?.call();
    }
  }

  @override
  Widget build(BuildContext context, AuthViewModel vm) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: [
            TextButton(
              onPressed: vm.onAuthPress,
              child: const Text('Auth'),
            ),
            TextField(
              onSubmitted: vm.onPinSubmit,
              decoration: const InputDecoration(
                labelText: 'Pin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
