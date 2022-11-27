import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/auth/auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'login_button.dart';
import 'pin_input.dart';

class AuthForm extends ViewModelWidget<AuthViewModel> {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context, AuthViewModel vm) {
    final colors = context.colors;
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'ようこそ',
              style: TextStyle(
                fontSize: 40,
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Aoba is a simple app for AniList that lets you see '
              'activity from your friends and quickly update your list.',
              style: TextStyle(color: colors.onSecondaryContainer),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [LoginButton(onPress: vm.onAuthPress)],
          ),
          const SizedBox(height: 24),
          if (kIsPinAuthMethod && vm.showPinInputField)
            PinInput(onSubmit: vm.onPinSubmit),
        ],
      ),
    );
  }
}
