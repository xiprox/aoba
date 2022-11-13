import 'package:aoba/exts/material_exts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => make(Brightness.light);
  static ThemeData dark() => make(Brightness.dark);

  static ThemeData make(Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: const Color(0xFF35ABF0),
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
      ),
      splashFactory: InkSparkle.splashFactory,
    );
  }
}
