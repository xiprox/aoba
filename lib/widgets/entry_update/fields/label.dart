import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;

  const Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Text(
      text,
      style: theme.textTheme.labelLarge?.copyWith(
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
