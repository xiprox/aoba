import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';
import 'package:stringr/stringr.dart';

class Status extends StatelessWidget {
  final String? status;
  final String? progress;
  final String? mediaTitle;
  final ColorScheme? mediaColorScheme;

  const Status({
    super.key,
    this.status,
    this.progress,
    this.mediaTitle,
    this.mediaColorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: status?.capitalize() ?? '?'),
          const TextSpan(text: ' '),
          TextSpan(text: progress ?? ''),
          if (progress != null) const TextSpan(text: ' of '),
          TextSpan(
            text: mediaTitle ?? '?',
            style: TextStyle(
              color: mediaColorScheme?.secondary ?? context.colors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
