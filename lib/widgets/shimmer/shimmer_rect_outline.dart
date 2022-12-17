import 'package:flutter/material.dart';

import 'shimmer.dart';

class ShimmerRectOutline extends StatelessWidget {
  final BorderRadius borderRadius;
  final double? width;
  final double? height;
  final bool enabled;
  final double borderWidth;
  final Widget? child;
  final Color? color;

  const ShimmerRectOutline({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.borderWidth = 2,
    this.enabled = true,
    this.child,
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
          border: Border.all(
            color: color ?? Shimmer.defaultColor(context),
            width: borderWidth,
          ),
        ),
        child: child,
      ),
    );
  }
}
