import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/quick_update/content/entry/quick_update_entry.dart';
import 'package:aoba/widgets/shimmer/shimmer_rect.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = colors.onSurface.withOpacity(0.2);
    return Row(
      children: [
        const SizedBox(width: 16),
        ShimmerRect(
          width: QuickUpdateEntry.kDesiredWidth,
          height: QuickUpdateEntry.kDesiredHeight,
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        const SizedBox(width: 8),
        ShimmerRect(
          width: QuickUpdateEntry.kDesiredWidth,
          height: QuickUpdateEntry.kDesiredHeight,
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        const SizedBox(width: 8),
        ShimmerRect(
          width: QuickUpdateEntry.kDesiredWidth,
          height: QuickUpdateEntry.kDesiredHeight,
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
