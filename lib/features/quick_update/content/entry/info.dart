import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/duration_exts.dart';
import 'package:aoba/widgets/action_loading_error/action_loading_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_box.dart';

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

    final countdown =
        Duration(seconds: timeUntilAiring ?? 0).toAiringCountdown();

    return InfoBox(
      color: colors.secondaryContainer,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'On ${mediaType == MediaType.ANIME ? 'ep' : 'ch'} '
                    '${progress ?? '?'}',
                    style: TextStyle(
                      color: colors.onSecondaryContainer,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (hasAiringInfo) ...[
                    Text(
                      'Next: $countdown',
                      style: TextStyle(
                        color: colors.onSecondaryContainer.withOpacity(0.6),
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
                  padding: const EdgeInsetsDirectional.only(end: 4),
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
