import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/int_exts.dart';

extension DoubleExts on double {
  /// Assumes that this double is an AniList media score (in a user's library)
  /// and returns a human readable string representation of it based on the
  /// user's selected score format.
  String toHumanReadableScore(ScoreFormat format) {
    switch (format) {
      case ScoreFormat.POINT_100:
        return '${round()}%';
      case ScoreFormat.POINT_10:
        return '${round()}/10';
      case ScoreFormat.POINT_5:
        return round().toStars();
      case ScoreFormat.POINT_10_DECIMAL:
        final isRound = this % 1 == 0;
        return '${isRound ? round() : toStringAsFixed(1)}/10';
      case ScoreFormat.POINT_3:
        if (this == 1) {
          return ':(';
        } else if (this == 2) {
          return ':|';
        } else if (this == 3) {
          return ':)';
        } else {
          return '';
        }
      case ScoreFormat.$unknown:
        return '';
    }
  }
}
