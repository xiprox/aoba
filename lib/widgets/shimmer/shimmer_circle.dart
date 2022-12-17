import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerCircle extends StatelessWidget {
  final double radius;
  final bool enabled;
  final Color? color;

  const ShimmerCircle(
    this.radius, {
    super.key,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: enabled,
      color: color,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? Shimmer.defaultColor(context),
        ),
      ),
    );
  }
}
