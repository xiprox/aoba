import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/lists/entries/common/list_entry_base.dart';
import 'package:aoba/widgets/lists/entries/common/status.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:flutter/material.dart';

import 'cover.dart';
import 'info.dart';

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
    const radius = Radius.circular(8);
    const coverRadius = Radius.circular(6);
    const borderRadius = BorderRadius.all(radius);
    const shape = SmoothRectangleBorder(borderRadius: borderRadius);
    return Material(
      color: colors.surfaceVariant,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onEditPress,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final coverHeight = constraints.maxWidth / AspectRatios.mediaCover;
            return Theme(
              data: theme,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Info(
                      title: title,
                      showEditIcon: onEditPress != null,
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
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: CoverImage(
                      url: coverUrl,
                      color: colors.surfaceVariant.manipulate(0.8),
                      height: coverHeight,
                      radius: coverRadius,
                      type: type.toImageType() ?? ImageType.generic,
                      onPress: onPress,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
