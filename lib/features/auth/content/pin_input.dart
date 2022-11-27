import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/smoorth_rectangle_border/smoorth_rectangle_border.dart';
import 'package:flutter/material.dart';

class PinInput extends StatelessWidget {
  final Function(String?) onSubmit;

  const PinInput({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Material(
      shape: SmoothRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: colors.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Sign in using the browser window that just opened and paste '
              'the code given by AniList here, then press Enter.',
              style: TextStyle(
                color: colors.onTertiaryContainer.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onSubmitted: onSubmit,
              style: TextStyle(color: colors.onTertiaryContainer),
              decoration: const InputDecoration(
                labelText: 'Pin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
