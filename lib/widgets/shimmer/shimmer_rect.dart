import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerRect extends StatelessWidget {
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final bool enabled;
  final Color? color;

  const ShimmerRect({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius = BorderRadius.zero,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: enabled,
      color: color,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: color ?? Shimmer.defaultColor(context),
        ),
      ),
    );
  }
}
