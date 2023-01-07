import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/widgets/flat_button/flat_button.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function()? onSeeAllListsPress;
  final Function()? onRefreshPress;

  const Header({
    super.key,
    this.onSeeAllListsPress,
    this.onRefreshPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Quick Update',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.secondary,
              fontSize: 18,
            ),
          ),
        ),
        FlatButton(
          onPress: onSeeAllListsPress,
          background: colors.secondary.withOpacity(0.05),
          foreground: colors.secondary,
          child: const Text('See all lists'),
        ),
        const Expanded(child: SizedBox(width: 8)),
        IconButton(
          onPressed: onRefreshPress,
          icon: const Icon(Icons.refresh_rounded),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
