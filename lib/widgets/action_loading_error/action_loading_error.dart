import 'package:aoba/widgets/curves/sine.dart';
import 'package:flutter/material.dart';
import 'package:aoba/widgets/constrained_animated_switcher/constrained_animated_switcher.dart';

import 'default/error.dart';
import 'default/loading.dart';

class ActionLoadingError extends StatelessWidget {
  final bool loading;
  final String? error;

  final Size size;
  final Widget action;
  final Widget? loadingState;
  final Widget? errorState;

  const ActionLoadingError({
    super.key,
    required this.loading,
    this.error,
    required this.size,
    required this.action,
    this.loadingState,
    this.errorState,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedAnimatedSwitcher(
      showFirst: error != null,
      size: size,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: CurvedAnimation(
              curve: const SineCurve(),
              parent: animation,
            ).drive(
              Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: const Offset(0, 0),
              ),
            ),
            child: child,
          ),
        );
      },
      one: errorState ?? ErrorState(error: error),
      two: ConstrainedAnimatedSwitcher(
        showFirst: loading,
        size: size,
        one: loadingState ?? const LoadingState(),
        two: action,
      ),
    );
  }
}
