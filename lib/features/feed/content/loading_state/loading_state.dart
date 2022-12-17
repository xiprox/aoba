import 'package:aoba/widgets/shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: const [
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
          _ActivityTile(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile();

  @override
  Widget build(BuildContext context) {
    return ShimmerRect(
      width: null,
      height: 88,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
