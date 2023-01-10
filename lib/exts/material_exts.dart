import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

extension ColorExts on Color {
  Color blendOn(Color background) {
    return Color.alphaBlend(this, background);
  }

  Color manipulate(double factor) {
    return Color.fromARGB(
      alpha,
      min(red * factor, 255).round(),
      min(green * factor, 255).round(),
      min(blue * factor, 255).round(),
    );
  }

  Color harmonize(Color source) {
    return Color(Blend.harmonize(value, source.value));
  }

  Color lighten(double amount) {
    final hct = Hct.fromInt(value);
    hct.tone = min(hct.tone + amount, 100);
    return Color(hct.toInt());
  }

  Color darken(double amount) {
    final hct = Hct.fromInt(value);
    hct.tone = max(hct.tone - amount, 0);
    return Color(hct.toInt());
  }
}

extension ColorSchemeExts on ColorScheme {
  /// See "Surface tones":
  /// https://m3.material.io/styles/color/the-color-system/color-roles
  Color get surfaceTone1 => primary.withOpacity(0.05).blendOn(background);
  Color get surfaceTone2 => primary.withOpacity(0.08).blendOn(background);
  Color get surfaceTone3 => primary.withOpacity(0.11).blendOn(background);
  Color get surfaceTone4 => primary.withOpacity(0.12).blendOn(background);
  Color get surfaceTone5 => primary.withOpacity(0.14).blendOn(background);
}
