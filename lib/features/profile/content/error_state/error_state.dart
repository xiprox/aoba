import 'package:aoba/data/model/resource.dart';
import 'package:aoba/widgets/fullscreen_error/fullscreen_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final ErrorInfo error;

  const ErrorState({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FullscreenError(error: error),
      ),
    );
  }
}
