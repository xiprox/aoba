import 'package:aoba/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'redirect_vm.dart';

class RedirectPage extends ViewModelWidget<RedirectViewModel> {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    RedirectViewModel vm,
  ) {
    if (order is MoveOn) {
      context.router.replaceAll([const HomeRoute()]);
    }
  }

  @override
  Widget build(BuildContext context, RedirectViewModel vm) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 5)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(vm.error ?? '?');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
