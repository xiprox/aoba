import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/duration_exts.dart';
import 'package:aoba/widgets/action_loading_error/action_loading_error.dart';
import 'package:aoba/widgets/media_cover_info_box/media_cover_info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Info extends StatelessWidget {
  final int? progress;
  final MediaType mediaType;
  final int? airingAt;
  final int? timeUntilAiring;
  final int? airingEpisode;

  final String? error;
  final bool loading;
  final Function()? onIncrementPress;

  const Info({
    super.key,
    this.progress,
    required this.mediaType,
    this.airingAt,
    this.timeUntilAiring,
    this.airingEpisode,
    this.error,
    this.loading = false,
    this.onIncrementPress,
  });

  bool get hasAiringInfo =>
      airingAt != null && timeUntilAiring != null && airingEpisode != null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final inkColor = colors.primary.withOpacity(0.2);
    final hoverColor = colors.primary.withOpacity(0.1);

    final airDate = DateTime.fromMillisecondsSinceEpoch((airingAt ?? 0) * 1000);
    final durationUntilAiring = Duration(seconds: timeUntilAiring ?? 0);
    final countdown = durationUntilAiring.inHours < 3
        ? durationUntilAiring.toAiringCountdown()
        : DateFormat('E h:mm a').format(airDate);

    final lastAiredEpisode = (airingEpisode ?? 1) - 1;
    final leftBehindEpisodes = lastAiredEpisode - (progress ?? 0);

    final isAnime = mediaType == MediaType.ANIME;
    final watchedReadLabel = isAnime ? 'Watched' : 'Read';
    final watchedReadLabelWithEpisode = '$watchedReadLabel $progress';

    return MediaCoverInfoBox(
      color: colors.secondaryContainer,
      height: 72,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        hasAiringInfo
                            ? watchedReadLabelWithEpisode
                            : watchedReadLabel,
                        style: TextStyle(
                          color: hasAiringInfo
                              ? colors.onSecondaryContainer
                              : colors.secondary,
                          fontWeight:
                              hasAiringInfo ? FontWeight.w500 : FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      if (leftBehindEpisodes > 0) ...[
                        const SizedBox(width: 2),
                        Text(
                          '(+$leftBehindEpisodes)',
                          style: TextStyle(
                            color: colors.secondary.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (!hasAiringInfo) ...[
                    Text(
                      '${isAnime ? 'Episode' : 'Chapter'} '
                      '${progress ?? '?'}',
                      style: TextStyle(
                        color: colors.onSecondaryContainer,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                  if (hasAiringInfo) ...[
                    Text(
                      countdown,
                      style: TextStyle(
                        color: colors.secondary.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: InkResponse(
              onTap: onIncrementPress == null
                  ? null
                  : () {
                      onIncrementPress?.call();
                      HapticFeedback.lightImpact();
                    },
              containedInkWell: false,
              focusColor: inkColor,
              splashColor: inkColor,
              hoverColor: hoverColor,
              highlightColor: inkColor,
              radius: 100,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 0),
                  child: ActionLoadingError(
                    loading: loading,
                    error: error,
                    size: const Size(26, 26),
                    action: Text(
                      '+1',
                      style: TextStyle(
                        fontSize: 18,
                        color: colors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
