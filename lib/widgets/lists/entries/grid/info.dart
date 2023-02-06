import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/lists/entries/common/title.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart' hide Title;

class Info extends StatelessWidget {
  static const kTotalHeight = 60.0;

  final String title;
  final Widget subtitle;
  final bool showEditIcon;

  const Info({
    super.key,
    required this.title,
    required this.subtitle,
    this.showEditIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Row(children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: colors.onSecondaryContainer,
                    ),
                  ),
                  subtitle,
                ],
              ),
            ),
          ]),
          if (showEditIcon)
            Icon(
              Icons.edit_rounded,
              color: colors.secondary.withOpacity(0.05),
            ),
        ],
      ),
    );
  }
}
