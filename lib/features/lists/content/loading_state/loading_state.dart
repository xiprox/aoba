import 'package:aoba/widgets/shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerCircle(8),
        SizedBox(width: 8),
        ShimmerCircle(8),
        SizedBox(width: 8),
        ShimmerCircle(8),
      ],
    );
  }
}
