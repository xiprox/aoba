import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

extension BuildContextExts on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);
  ColorScheme get colors => theme.colorScheme;

  Offset findPosition() {
    final RenderBox box = findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero);
  }
}
