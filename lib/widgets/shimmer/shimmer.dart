import 'package:aoba/exts/build_context_exts.dart';
import 'package:shimmer/shimmer.dart' as shimmer;
import 'package:aoba/exts/material_exts.dart';
import 'package:flutter/material.dart';

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

  static Color defaultColor(BuildContext context) {
    return context.colors.surfaceTone1;
  }

  @override
  Widget build(BuildContext context) {
    final c = color ?? defaultColor(context);
    return shimmer.Shimmer.fromColors(
      enabled: enabled,
      baseColor: c,
      highlightColor: c.manipulate(1.1),
      child: child,
    );
  }
}
