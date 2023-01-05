import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:flutter/material.dart';

/// A wrapper around [ResourceBuilder]s that provides a common transition
/// animation between states.
class ResourceBuilderAnimatedSwitcher extends StatelessWidget {
  final ResourceBuilder child;
  final Duration duration;
  final Curve switchInCurve;
  final Curve? switchOutCurve;

  ResourceBuilderAnimatedSwitcher({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 400),
    this.switchInCurve = Curves.fastOutSlowIn,
    this.switchOutCurve,
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
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve ?? switchInCurve.flipped,
      child: child,
    );
  }
}
