import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerText extends StatelessWidget {
  final double width;
  final double height;
  final bool enabled;
  final Color? color;

  const ShimmerText({
    super.key,
    this.width = double.infinity,
    this.height = 12,
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
          borderRadius: BorderRadius.circular(4),
          color: color ?? Shimmer.defaultColor(context),
        ),
      ),
    );
  }
}
