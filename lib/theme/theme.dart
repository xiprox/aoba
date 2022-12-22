import 'package:aoba/exts/material_exts.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

const _kDefaultSeedColor = Color.fromRGBO(92, 182, 72, 1);

class AppTheme {
  static ThemeData light(Color? seed) => make(seed, Brightness.light);
  static ThemeData dark(Color? seed) => make(seed, Brightness.dark);

  static ThemeData make(Color? seed, Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: seed ?? _kDefaultSeedColor,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      cardTheme: CardTheme(
        elevation: 0,
        color: colors.surfaceTone1,
        surfaceTintColor: colors.surfaceTint,
      ),
      splashColor: colors.primary.withOpacity(0.05),
      focusColor: colors.primary.withOpacity(0.05),
      hoverColor: colors.primary.withOpacity(0.05),
      highlightColor: colors.primary.withOpacity(0.05),
      splashFactory: InkSparkle.splashFactory,
    );
  }

  /// Returns a version of the app theme with the given [seed] color based
  /// on the brightness of the theme at [context]. If [color] is null, returns
  /// the existing theme at [context].
  static ThemeData override(BuildContext context, Color? color) {
    final theme = context.theme;
    final brightness = theme.brightness;
    if (color == null) {
      return theme;
    } else {
      return brightness == Brightness.light ? light(color) : dark(color);
    }
  }
}
