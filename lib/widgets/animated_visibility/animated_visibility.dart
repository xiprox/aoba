import 'package:flutter/cupertino.dart';

class AnimatedVisibility extends StatelessWidget {
  final bool visible;
  final Widget child;

  const AnimatedVisibility({
    super.key,
    required this.visible,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 400);
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn.flipped,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.6, 1.0),
          ),
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
      child: visible ? child : Container(),
    );
  }
}
