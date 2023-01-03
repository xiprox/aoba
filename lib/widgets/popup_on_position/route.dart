import 'dart:math';
import 'dart:ui';

import 'package:aoba/widgets/painting/clippers/circular_reveal_clipper.dart';
import 'package:flutter/material.dart';

const double kDesiredPopupWidth = 320.0;

/// How much padding to the edge of the screen the popup should have.
const double kPaddingFromScreenEdge = 8.0;

const double kMaxWidthPercentOfParent = 0.8; // 80%
const double kMaxHeightPercentOfParent = 0.7; // 70%

class PopupOnPositionRoute extends PopupRoute {
  final Offset position;
  final Offset? triggerPosition;
  final Widget child;

  PopupOnPositionRoute({
    required this.position,
    this.triggerPosition,
    required this.child,
  });

  @override
  Curve get barrierCurve => Curves.fastOutSlowIn;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipPath(
      clipper: CircularRevealClipper(
        fraction: animation.value,
        centerOffset: triggerPosition,
      ),
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black26;

  @override
  final String barrierLabel = '';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return CustomSingleChildLayout(
      delegate: _PopupChildLayout(position),
      child: child,
    );
  }
}

class _PopupChildLayout extends SingleChildLayoutDelegate {
  const _PopupChildLayout(this.position);

  final Offset position;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final availableWidth = constraints.biggest.width;
    final availableHeight = constraints.biggest.height;

    final width =
        min(availableWidth * kMaxWidthPercentOfParent, kDesiredPopupWidth);
    final height = availableHeight * kMaxWidthPercentOfParent;

    return BoxConstraints.loose(Size(width, height));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double y = position.dy + kPaddingFromScreenEdge;
    double x = position.dx + kPaddingFromScreenEdge;
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupChildLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}
