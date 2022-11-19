import 'package:aoba/exts/material_exts.dart';
import 'package:flutter/material.dart';

const _kDefaultSeedColor = Color(0xFF5cb648);

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
      backgroundColor: colors.surfaceTone1,
      scaffoldBackgroundColor: colors.background,
      cardTheme: CardTheme(
        elevation: 0,
        color: colors.surfaceTone1,
        surfaceTintColor: colors.surfaceTint,
      ),
      splashColor: colors.primary.withOpacity(0.05),
      focusColor: colors.primary.withOpacity(0.05),
      hoverColor: colors.primary.withOpacity(0.05),
      highlightColor: colors.primary.withOpacity(0.05),
      splashFactory: InkRipple.splashFactory,
    );
  }
}
