import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:flutter/material.dart';

/// A wrapper around [ResourceBuilder]s that provides a common transition
/// animation between states.
class ResourceBuilderAnimatedSwitcher extends StatelessWidget {
  final ResourceBuilder child;

  ResourceBuilderAnimatedSwitcher({
    super.key,
    required this.child,
  }) {
    if (child.key == null) {
      throw ArgumentError(
        'When using $ResourceBuilderAnimatedSwitcher, the '
        'child $ResourceBuilder must have a $Key. This ensures that the '
        '$AnimatedSwitcher will properly transition between states at all '
        'times.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn.flipped,
      child: child,
    );
  }
}
