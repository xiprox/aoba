import 'package:aoba/data/model/resource.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final ErrorInfo error;

  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: colors.errorContainer,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              error.message,
              style: TextStyle(
                color: colors.onErrorContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
