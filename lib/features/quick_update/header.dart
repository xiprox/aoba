import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function()? onRefreshPress;

  const Header({
    super.key,
    this.onRefreshPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Quick Update',
              style: TextStyle(
                color: colors.secondary,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: onRefreshPress,
          color: colors.secondary,
          icon: const Icon(Icons.refresh_rounded),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
