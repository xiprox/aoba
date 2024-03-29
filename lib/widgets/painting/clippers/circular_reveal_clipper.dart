import 'dart:math' show sqrt, max;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;

  const CircularRevealClipper({
    required this.fraction,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final Offset center = centerOffset ??
        Offset(
          size.width / 2,
          size.height / 2,
        );
    final minRadius = this.minRadius ?? 0;
    final maxRadius = this.maxRadius ?? calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(minRadius, maxRadius, fraction) ?? 0,
        ),
      );
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) {
    return fraction != oldClipper.fraction ||
        centerOffset != oldClipper.centerOffset ||
        minRadius != oldClipper.minRadius ||
        maxRadius != oldClipper.maxRadius;
  }

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
