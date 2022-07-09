import 'package:aoba/exts/string_exts.dart';
import 'package:flutter/painting.dart';

class AniListUtils {
  Color? colorFromProfileColor(String? color) {
    switch (color) {
      case 'blue':
        return const Color(0xFF35ABF0);
      case 'purple':
        return const Color(0xFFB858FF);
      case 'pink':
        return const Color(0xFFFC92D0);
      case 'orange':
        return const Color(0xFFED7D19);
      case 'red':
        return const Color(0xFFDD2D2D);
      case 'green':
        return const Color(0xFF43C347);
      case 'gray':
        return const Color(0xFF5C7089);
      default:
        return color?.toColor();
    }
  }
}
