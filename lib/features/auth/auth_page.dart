import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/auth/content/auth_form.dart';
import 'package:aoba/features/auth/content/illustration.dart';
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
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: Stack(
        children: const [
          BackgroundIllustration(),
          AuthForm(),
        ],
      ),
    );
  }
}
