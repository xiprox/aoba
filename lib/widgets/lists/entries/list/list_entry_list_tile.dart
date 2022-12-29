import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/lists/entries/common/title.dart';
import 'package:aoba/widgets/lists/entries/common/list_entry_base.dart';
import 'package:aoba/widgets/lists/entries/common/status.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart' hide Title;

class ListEntryListTile extends ListEntryBase {
  final int index;
  final bool compact;
  final EdgeInsetsGeometry padding;

  const ListEntryListTile({
    super.key,
    required this.index,
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
    this.compact = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.override(context, color);
    final colors = theme.colorScheme;

    const borderRadius = BorderRadius.all(Radius.circular(8));

    return Theme(
      data: theme,
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              if (!compact) ...[
                NetworkImageWithPlaceholder(
                  url: coverUrl,
                  color: colors.surfaceVariant.manipulate(0.8),
                  borderRadius: borderRadius,
                  height: 48 / AspectRatios.mediaCover,
                  width: 48,
                  type: type.toImageType() ?? ImageType.generic,
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      title,
                      style: const TextStyle(fontSize: 16, height: 1.1),
                    ),
                    Status(
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
                  ],
                ),
              ),
              InkWell(
                onTap: onEditPress,
                borderRadius: borderRadius,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.edit_rounded,
                    color: colors.secondary,
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
