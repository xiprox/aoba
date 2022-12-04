import 'package:flutter/material.dart';
import 'package:aoba/exts/build_context_exts.dart';

class ErrorOverlay extends StatelessWidget {
  final String? error;

  const ErrorOverlay(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Positioned.fill(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.fastOutSlowIn,
        switchOutCurve: Curves.fastOutSlowIn.flipped,
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: error == null
            ? const SizedBox.shrink()
            : Container(
                color: colors.surface,
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    error ?? 'Something went wrong',
                    style: TextStyle(color: colors.error),
                  ),
                ),
              ),
      ),
    );
  }
}
