import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/double_exts.dart';
import 'package:aoba/exts/duration_exts.dart';
import 'package:aoba/exts/string_exts.dart';
import 'package:flutter/material.dart';
import 'package:aoba/data/model/aliases.dart';

/// Displays a short status text for a media list entry in a grid.
///
/// It tries to choose the most relevant information based on the [MediaType]
/// and the [MediaFormat] of the entry.
class Status extends StatelessWidget {
  final MediaListStatus status;
  final MediaType type;
  final MediaFormat format;
  final MediaStatus mediaStatus;
  final int? duration;
  final int progress;
  final int total;
  final ScoreFormat? scoreFormat;
  final double? score;

  const Status({
    super.key,
    required this.status,
    required this.type,
    required this.format,
    required this.mediaStatus,
    required this.duration,
    required this.progress,
    required this.total,
    required this.scoreFormat,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    String? value;

    // If total is 0, we want to display, for example, 'Watched 12/?' instead
    // of 'Watched 12/0' or '? chapters' instead of '0 chapters'.
    //
    // This occurs especially with ongoing manga, where the final chapter count
    // isn't known.
    final isTotalKnown = total > 0;
    final totalText = isTotalKnown ? total : '?';

    switch (status) {
      // I already know what this is but may have forgotten how long it is.
      //
      // Key info: how much did I watch/read and how much is there in total?
      case MediaListStatus.CURRENT:
      case MediaListStatus.PAUSED:
      case MediaListStatus.DROPPED:
        if (type == MediaType.ANIME) {
          value = 'Watched $progress/$totalText';
        } else {
          value = 'Read $progress/$totalText';
        }
        break;

      // Same as CURRENT (see above) except we prepend "Re-".
      case MediaListStatus.REPEATING:
        if (type == MediaType.ANIME) {
          value = 'Re-watched $progress/$totalText';
        } else {
          value = 'Re-read $progress/$totalText';
        }
        break;

      // I have not watched/read this and likely don't know much about it,
      // or I may have forgotten.
      //
      // Key info: what is this and how long is it?
      case MediaListStatus.PLANNING:
        switch (format) {
          case MediaFormat.TV:
          case MediaFormat.TV_SHORT:
          case MediaFormat.SPECIAL:
          case MediaFormat.OVA:
          case MediaFormat.ONA:
            if (isTotalKnown) {
              final length =
                  '$totalText ${'episode'.plural('episodes', total)}';
              value = '${format.displayName} • $length';
            } else {
              value = '${format.displayName} • ${mediaStatus.displayName}';
            }
            break;
          case MediaFormat.MOVIE:
          case MediaFormat.MUSIC:
            final dur = duration == null
                ? null
                : Duration(minutes: duration!).toMediaDuration();
            value = format.displayName.append(dur?.prepend(' • '));
            break;
          case MediaFormat.MANGA:
          case MediaFormat.NOVEL:
            final formatText =
                format == MediaFormat.MANGA ? null : format.displayName;
            if (isTotalKnown) {
              final length =
                  '$totalText ${'chapter'.plural('chapters', total)}';
              value = '${formatText?.append(' • ')}$length';
            } else {
              // If the total is unknown, it's more useful to know if the media
              // has finished releasing or not.
              value = '${formatText?.append(' • ')}${mediaStatus.displayName}';
            }
            break;
          case MediaFormat.ONE_SHOT:
            value = format.displayName;
            break;
          case MediaFormat.$unknown:
            break;
        }
        break;

      // I watched/read this so I know what it is, and its length no longer
      // matters. I may be curious about how I rated it.
      //
      // Key info: what did I rate it?
      case MediaListStatus.COMPLETED:
        if (score != null && score! > 0 && scoreFormat != null) {
          value = 'Rated ${score!.toHumanReadableScore(scoreFormat!)}';
        } else {
          value = 'Not rated';
        }
        break;

      case MediaListStatus.$unknown:
        break;
    }

    if (value == null) {
      return Container();
    }

    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.fade,
      softWrap: false,
      style: TextStyle(
        fontSize: 12,
        color: colors.onSecondaryContainer.withOpacity(0.5),
      ),
    );
  }
}
