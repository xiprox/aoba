import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class Title extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const Title(
    this.title, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: TextStyle(
          color: context.colors.onSecondaryContainer,
        ).merge(style),
      ),
    );
  }
}
