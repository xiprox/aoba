import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerRect extends StatelessWidget {
  final BorderRadius borderRadius;
  final double width;
  final double height;
  final bool enabled;
  final Color? color;

  const ShimmerRect({
    super.key,
    required this.width,
    required this.height,
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
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
