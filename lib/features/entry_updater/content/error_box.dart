import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/widgets/animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String? error;

  const ErrorBox({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedVisibility(
      visible: error != null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          color: colors.surfaceVariant.darken(6),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: colors.error,
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    error ?? '',
                    style: TextStyle(
                      color: colors.error,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
