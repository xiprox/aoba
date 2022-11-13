import 'package:aoba/exts/material_exts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

export 'shimmer_circle.dart';
export 'shimmer_rect_outline.dart';
export 'shimmer_rect.dart';
export 'shimmer_text.dart';

class Shimmer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color? color;

  const Shimmer({
    super.key,
    required this.child,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return shimmer.Shimmer.fromColors(
      enabled: enabled,
      baseColor: color ?? Colors.grey[300]!,
      highlightColor: color?.manipulate(1.4) ?? Colors.grey[200]!,
      child: child,
    );
  }
}
