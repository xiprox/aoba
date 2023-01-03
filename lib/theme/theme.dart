import 'package:aoba/exts/material_exts.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _kDefaultSeedColor = Color.fromRGBO(92, 182, 72, 1);

class AppTheme {
  static ThemeData light(Color? seed) => make(seed, Brightness.light);
  static ThemeData dark(Color? seed) => make(seed, Brightness.dark);

  static ThemeData make(Color? seed, Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: seed ?? _kDefaultSeedColor,
      brightness: brightness,
    );
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      splashColor: colors.primary.withOpacity(0.1),
      focusColor: colors.primary.withOpacity(0.05),
      hoverColor: colors.primary.withOpacity(0.05),
      highlightColor: colors.primary.withOpacity(0.05),
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: const AppBarTheme(
        titleSpacing: 8,
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: colors.surfaceTone1,
        surfaceTintColor: colors.surfaceTint,
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          side: MaterialStateProperty.all(BorderSide(
            color: colors.outlineVariant,
          )),
          foregroundColor: MaterialStateProperty.all(colors.onBackground),
        ),
      ),
    );
    final textTheme = GoogleFonts.rubikTextTheme(theme.textTheme);
    return theme.copyWith(
      textTheme: theme.textTheme.copyWith(
        displaySmall: textTheme.displaySmall,
        displayMedium: textTheme.displayMedium,
        displayLarge: textTheme.displayLarge,
        titleSmall: textTheme.titleSmall,
        titleMedium: textTheme.titleMedium,
        titleLarge: textTheme.titleLarge,
        headlineSmall: textTheme.headlineSmall,
        headlineMedium: textTheme.headlineMedium,
        headlineLarge: textTheme.headlineLarge,
        labelSmall: textTheme.labelSmall,
        labelMedium: textTheme.labelMedium,
        labelLarge: textTheme.labelLarge,
      ),
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
