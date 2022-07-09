import 'package:flutter/painting.dart';

extension StringExts on String? {
  Color? toColor() {
    if (this != null) {
      if (this!.isNotEmpty && this!.startsWith('#')) {
        final colorString = this!.substring(1);
        String? hexString;
        if (this!.length == 9) hexString = '0x$colorString';
        if (this!.length == 7) hexString = '0xff$colorString';
        if (this!.length == 4) hexString = '0xff$colorString$colorString';
        if (hexString == null) return null;
        final colorInt = int.tryParse(hexString);
        if (colorInt == null) return null;
        return Color(colorInt);
      }
    }
    return null;
  }
}
