import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/lists/entries/common/list_entry_base.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

import 'cover.dart';
import 'info.dart';
import '../common/status.dart';

class ListEntryGridTile extends ListEntryBase {
  static const kDesiredWidth = 128.0;

  const ListEntryGridTile({
    super.key,
    required super.title,
    super.coverUrl,
    super.color,
    required super.type,
    required super.format,
    required super.mediaStatus,
    required super.status,
    required super.duration,
    required super.progress,
    required super.total,
    super.scoreFormat,
    super.score,
    super.onPress,
    super.onEditPress,
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
