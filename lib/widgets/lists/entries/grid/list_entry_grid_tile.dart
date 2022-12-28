import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

import 'cover.dart';
import 'info.dart';
import 'status.dart';

class ListEntryGridTile extends StatelessWidget {
  static const kDesiredWidth = 128.0;

  final String title;
  final String? coverUrl;
  final Color? color;
  final MediaType type;
  final MediaFormat format;
  final MediaStatus mediaStatus;
  final MediaListStatus status;
  final int duration;
  final int progress;
  final int total;
  final ScoreFormat? scoreFormat;
  final double? score;

  final Function()? onPress;
  final Function()? onEditPress;

  const ListEntryGridTile({
    super.key,
    required this.title,
    this.coverUrl,
    this.color,
    required this.type,
    required this.format,
    required this.mediaStatus,
    required this.status,
    required this.duration,
    required this.progress,
    required this.total,
    this.scoreFormat,
    this.score,
    this.onPress,
    this.onEditPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.override(context, color);
    final colors = theme.colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final coverHeight = constraints.maxWidth / AspectRatios.mediaCover;
        const radius = Radius.circular(8);
        return Theme(
          data: theme,
          child: Stack(
            children: [
              CoverImage(
                url: coverUrl,
                color: colors.surfaceVariant.manipulate(0.8),
                height: coverHeight,
                radius: radius,
                type: type.toImageType() ?? ImageType.generic,
                onPress: onPress,
              ),
              Padding(
                padding: EdgeInsets.only(top: coverHeight - Info.kWaveHeight),
                child: Info(
                  title: title,
                  radius: radius,
                  onPress: onEditPress,
                  subtitle: Status(
                    status: status,
                    type: type,
                    format: format,
                    mediaStatus: mediaStatus,
                    duration: duration,
                    progress: progress,
                    total: total,
                    scoreFormat: scoreFormat,
                    score: score,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
