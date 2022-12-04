import 'package:aoba/arch/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

mixin SnackBarMixin {
  void showSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

mixin SnackBarInViewModelWidgetMixin<T extends ViewModel>
    on ViewModelWidget<T>, SnackBarMixin {
  @override
  void handleOrder(BuildContext context, ViewModelOrder order, T vm) {
    if (order is ShowSnackBar) {
      showSnackBar(context, order.message);
    }
  }
}
