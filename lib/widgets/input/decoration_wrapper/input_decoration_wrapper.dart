import 'package:aoba/exts/theme_data_exts.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

/// Wraps given [child] widget in a [Material] widget that looks the same as
/// the [InputDecoration] defined in the parent [ThemeData].
class InputDecorationWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Function()? onPress;

  const InputDecorationWrapper({
    super.key,
    required this.child,
    this.onPress,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final decorationTheme = theme.inputDecorationTheme;
    final borderRadius =
        decorationTheme.borderRadius?.resolve(Directionality.of(context)) ??
            BorderRadius.zero;
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: decorationTheme.border?.borderSide
                .copyWith(color: colors.outline) ??
            BorderSide.none,
      ),
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onPress,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding ?? decorationTheme.contentPadding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
