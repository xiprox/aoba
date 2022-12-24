import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/quick_update/content/entry/error_overlay.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

import 'info.dart';

class QuickUpdateEntryTile extends StatelessWidget {
  static const kDesiredHeight = kDesiredWidth / AspectRatios.mediaCover;
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

  final String? error;
  final bool loading;
  final Function()? onIncrementPress;

  const QuickUpdateEntryTile({
    super.key,
    required this.coverUrl,
    required this.type,
    this.color,
    required this.mediaType,
    required this.airingAt,
    required this.timeUntilAiring,
    required this.airingEpisode,
    required this.progress,
    this.error,
    this.loading = false,
    this.onIncrementPress,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(8);

    final theme = AppTheme.override(context, color);
    final colors = theme.colorScheme;
    final inkColor = colors.secondary.withOpacity(0.2);
    final hoverColor = colors.secondary.withOpacity(0.1);

    final enabled = !loading && error == null;

    return Theme(
      data: theme,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          height: kDesiredHeight,
          width: kDesiredWidth,
          child: Stack(
            children: [
              NetworkImageWithPlaceholder(
                type: type,
                url: coverUrl,
                color: colors.surfaceVariant,
              ),
              ErrorOverlay(error),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: enabled ? () {} : null,
                    splashColor: inkColor,
                    hoverColor: hoverColor,
                    highlightColor: inkColor,
                    child: Info(
                      progress: progress,
                      mediaType: mediaType,
                      airingAt: airingAt,
                      timeUntilAiring: timeUntilAiring,
                      airingEpisode: airingEpisode,
                      error: error,
                      loading: loading,
                      onIncrementPress: enabled ? onIncrementPress : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
