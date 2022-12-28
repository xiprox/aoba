import 'package:aoba/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class TabsLoadingState extends StatelessWidget {
  const TabsLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 16),
          ShimmerRect(width: 72, height: 16, borderRadius: borderRadius),
          const SizedBox(width: 40),
          ShimmerRect(width: 64, height: 16, borderRadius: borderRadius),
          const SizedBox(width: 40),
          ShimmerRect(width: 48, height: 16, borderRadius: borderRadius),
          const SizedBox(width: 40),
          ShimmerRect(width: 72, height: 16, borderRadius: borderRadius),
        ],
      ),
    );
  }
}
