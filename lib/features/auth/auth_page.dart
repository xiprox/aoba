import 'dart:io';

import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/auth/illustration.dart';
import 'package:aoba/features/auth/login_button.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'auth_vm.dart';
import 'pin_entry.dart';

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
        children: [
          const BackgroundIllustration(),
          Center(
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
                    'Aoba is a simple client app for AniList that lets you see '
                    'activity from your friends and quickly update your list.',
                    style: TextStyle(color: colors.onSecondaryContainer),
                  ),
                ),
                const SizedBox(height: 16),
                LoginButton(onPress: vm.onAuthPress),
                const SizedBox(height: 24),
                if ((Platform.isWindows || Platform.isMacOS) &&
                    vm.showPinInputField)
                  PinEntry(onSubmit: vm.onPinSubmit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
