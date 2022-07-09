import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

extension BuildContextExts on BuildContext {
  ColorScheme get colors => theme.colorScheme;
}
