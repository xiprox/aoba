import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:flutter/material.dart';

class PopupOnPositionContainer extends StatelessWidget {
  final Widget child;
  const PopupOnPositionContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const borderRadius = BorderRadius.all(Radius.circular(16));
    return Material(
      color: colors.surfaceTone1,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
