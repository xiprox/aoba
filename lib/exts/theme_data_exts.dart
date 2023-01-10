import 'package:flutter/material.dart';

extension ThemeDataExts on InputDecorationTheme {
  BorderRadius? get borderRadius {
    if (border is OutlineInputBorder) {
      return (border as OutlineInputBorder).borderRadius;
    }
    return null;
  }
}
