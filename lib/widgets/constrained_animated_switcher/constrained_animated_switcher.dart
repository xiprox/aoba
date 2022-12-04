import 'package:flutter/material.dart';

/// An animateed widget switcher that constrains itself to a given dimensions.
/// This is useful when animating between two widgets of different sizes, to
/// prevent jittery positioning durting the transition due to the parent
/// changing its size.
class ConstrainedAnimatedSwitcher extends StatelessWidget {
  final bool showFirst;
  final Size size;
  final Widget one;
  final Widget two;

  final Duration? duration;
  final Curve? switchInCurve;
  final Curve? switchOutCurve;
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  const ConstrainedAnimatedSwitcher({
    super.key,
    required this.showFirst,
    required this.size,
    required this.one,
    required this.two,
    this.duration,
    this.switchInCurve,
    this.switchOutCurve,
    this.transitionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: AnimatedSwitcher(
        duration: duration ?? const Duration(milliseconds: 300),
        switchInCurve: switchInCurve ?? Curves.fastOutSlowIn,
        switchOutCurve: switchOutCurve ?? Curves.fastOutSlowIn.flipped,
        transitionBuilder: (child, animation) {
          if (transitionBuilder != null) {
            return transitionBuilder!(child, animation);
          }

          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: CurvedAnimation(
                curve: const Interval(0.5, 1),
                parent: animation,
              ),
              child: child,
            ),
          );
        },
        child: Center(
          key: ValueKey(showFirst),
          child: showFirst ? one : two,
        ),
      ),
    );
  }
}
