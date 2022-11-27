import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/duration_exts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_box.dart';

class Info extends StatelessWidget {
  final ColorScheme colorScheme;
  final int? progress;
  final MediaType mediaType;
  final int? airingAt;
  final int? timeUntilAiring;
  final int? airingEpisode;
  final Function()? onIncrementPress;

  const Info({
    super.key,
    required this.colorScheme,
    this.progress,
    required this.mediaType,
    this.airingAt,
    this.timeUntilAiring,
    this.airingEpisode,
    this.onIncrementPress,
  });

  bool get hasAiringInfo =>
      airingAt != null && timeUntilAiring != null && airingEpisode != null;

  @override
  Widget build(BuildContext context) {
    final inkColor = colorScheme.primary.withOpacity(0.2);
    final hoverColor = colorScheme.primary.withOpacity(0.1);

    final countdown =
        Duration(seconds: timeUntilAiring ?? 0).toAiringCountdown();

    return InfoBox(
      color: colorScheme.secondaryContainer,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: hasAiringInfo ? 4 : 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On ${mediaType == MediaType.ANIME ? 'ep' : 'ch'} '
                    '${progress ?? '?'}',
                    style: TextStyle(
                      height: 1,
                      color: colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (hasAiringInfo) ...[
                    Text(
                      'Next: $countdown',
                      style: TextStyle(
                        color:
                            colorScheme.onSecondaryContainer.withOpacity(0.6),
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
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    '+1',
                    style: TextStyle(
                      fontSize: 18,
                      color: colorScheme.primary,
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
