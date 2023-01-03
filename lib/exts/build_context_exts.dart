import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

extension BuildContextExts on BuildContext {
  MediaQueryData get media => MediaQuery.of(this);
  ColorScheme get colors => theme.colorScheme;

  RenderBox findRenderBox() {
    return findRenderObject() as RenderBox;
  }

  Offset findPosition() {
    return findRenderBox().localToGlobal(Offset.zero);
  }
}
