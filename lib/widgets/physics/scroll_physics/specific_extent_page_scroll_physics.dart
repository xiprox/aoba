import 'dart:math';

import 'package:flutter/widgets.dart';

/// A [PageScrollPhysics] that snaps at every [extent] pixels.
class SpecificExtentPageScrollPhysics extends PageScrollPhysics {
  final double extent;

  const SpecificExtentPageScrollPhysics({
    required this.extent,
    super.parent,
  });

  @override
  SpecificExtentPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SpecificExtentPageScrollPhysics(
      extent: extent,
      parent: buildParent(ancestor),
    );
  }

  double _getPage(ScrollMetrics position) {
    return position.pixels / extent;
  }

  double _getPixels(double page) {
    return page * extent;
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
  ) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return min(
      _getPixels(page.roundToDouble()),
      position.maxScrollExtent,
    );
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final tolerance = toleranceFor(position);
    final target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
