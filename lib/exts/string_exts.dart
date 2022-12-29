import 'package:aoba/utils/anilist_utils.dart';
import 'package:flutter/painting.dart';

extension StringExts on String {
  Color? toColor() {
    if (isNotEmpty && startsWith('#')) {
      final colorString = substring(1);
      String? hexString;
      if (length == 9) hexString = '0x$colorString';
      if (length == 7) hexString = '0xff$colorString';
      if (length == 4) hexString = '0xff$colorString$colorString';
      if (hexString == null) return null;
      final colorInt = int.tryParse(hexString);
      if (colorInt == null) return null;
      return Color(colorInt);
    }
    return null;
  }

  Color? fromAniListColor() {
    return AniListUtils().colorFromProfileColor(this);
  }

  /// Easy way to pluralize a string. A naive implementation but since this app
  /// will only be in English, it's fine.
  ///
  /// Example:
  /// ```dart
  /// 'episode'.plural('episodes', 2);
  /// ```
  String plural(String more, int count) {
    return count == 1 ? this : more;
  }

  String append(String? other) {
    return other != null ? '$this$other' : this;
  }

  String prepend(String? other) {
    return other != null ? '$other$this' : this;
  }
}
