import 'dart:math';

import 'package:flutter/material.dart';

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
}

extension ColorSchemeExts on ColorScheme {
  /// See "Surface tones":
  /// https://m3.material.io/styles/color/the-color-system/color-roles
  Color get surfaceTone1 => primary.withOpacity(0.05);
  Color get surfaceTone2 => primary.withOpacity(0.08);
  Color get surfaceTone3 => primary.withOpacity(0.11);
  Color get surfaceTone4 => primary.withOpacity(0.12);
  Color get surfaceTone5 => primary.withOpacity(0.14);
}
