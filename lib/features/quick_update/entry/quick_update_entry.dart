import 'package:aoba/consts/consts.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

import 'airing_info.dart';
import 'progress_info.dart';

class QuickUpdateEntry extends StatelessWidget {
  static const kDesiredHeight = kDesiredWidth * AspectRatios.mediaCover;
  static const kDesiredWidth = 144.0;

  final String coverUrl;
  final ImageType type;
  final Color? color;

  final MediaType mediaType;

  /// Airing info
  final int? airingAt;
  final int? timeUntilAiring;
  final int? airingEpisode;

  // Progress info
  final int? progress;

  final Function()? onIncrementPress;

  const QuickUpdateEntry({
    super.key,
    required this.coverUrl,
    required this.type,
    this.color,
    required this.mediaType,
    required this.airingAt,
    required this.timeUntilAiring,
    required this.airingEpisode,
    required this.progress,
    this.onIncrementPress,
  });

  bool get hasAiringInfo =>
      airingAt != null && timeUntilAiring != null && airingEpisode != null;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    final theme = context.theme;
    final colorScheme = ColorScheme.fromSeed(
      seedColor: color ?? theme.colorScheme.primary,
      brightness: theme.brightness,
    );
    final inkColor = colorScheme.secondary.withOpacity(0.2);
    final hoverColor = colorScheme.secondary.withOpacity(0.1);

    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: kDesiredHeight,
        width: kDesiredWidth,
        child: Stack(
          children: [
            NetworkImageWithPlaceholder(
              type: type,
              url: coverUrl,
              color: colorScheme.surfaceVariant,
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: inkColor,
                  hoverColor: hoverColor,
                  highlightColor: inkColor,
                  child: hasAiringInfo
                      ? AiringInfo(
                          colorScheme: colorScheme,
                          airingAt: airingAt,
                          timeUntilAiring: timeUntilAiring,
                          episode: airingEpisode,
                        )
                      : ProgressInfo(
                          colorScheme: colorScheme,
                          progress: progress,
                          mediaType: mediaType,
                          onIncrementPress: onIncrementPress,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
