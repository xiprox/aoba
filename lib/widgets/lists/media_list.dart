import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

import 'entries/grid/info.dart';
import 'entries/grid/list_entry_grid_tile.dart';
import 'entries/list/list_entry_list_tile.dart';

enum ListDisplayType {
  grid,
  listComfortable,
  listCompact,
}

class MediaListView extends StatelessWidget {
  final MediaList list;
  final MediaType type;
  final ScoreFormat scoreFormat;
  final Function(MediaListEntry entry) onEntryPress;
  final bool canEditEntries;
  final Function(MediaListEntry entry) onEntryEditPress;
  final ListDisplayType displayType;

  const MediaListView({
    super.key,
    required this.list,
    required this.type,
    required this.scoreFormat,
    required this.onEntryPress,
    required this.canEditEntries,
    required this.onEntryEditPress,
    this.displayType = ListDisplayType.grid,
  });

  @override
  Widget build(BuildContext context) {
    if (displayType == ListDisplayType.grid) {
      final availableWidth = context.media.size.width;
      const desiredTileWidth = ListEntryGridTile.kDesiredWidth;

      // How many tiles will fit in the available width?
      final columns = (availableWidth / desiredTileWidth).floor();

      // Spacing around and in between columns.
      const spacing = 8.0;

      // +1 for the spacing between the last column and the right edge.
      final totalSpacingPerRow = spacing * (columns + 1);

      // The optimal width to perfectly fit columns into available width.
      final optimalColumnWidth =
          (availableWidth - totalSpacingPerRow) / columns;

      final coverHeight = optimalColumnWidth / AspectRatios.mediaCover;

      const infoBoxHeight = Info.kTotalHeight;
      final finalTileHeight = coverHeight + infoBoxHeight;

      return GridView.builder(
        padding: const EdgeInsets.all(spacing),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisExtent: finalTileHeight,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
        ),
        itemCount: list.entries?.length ?? 0,
        itemBuilder: (context, index) {
          final entry = list.entries?[index];
          final media = entry?.media;

          if (entry == null || media == null) return Container();

          return ListEntryGridTile(
            title: media.title?.userPreferred ?? '?',
            coverUrl: media.coverImage?.large,
            type: media.type ?? MediaType.$unknown,
            format: media.format ?? MediaFormat.$unknown,
            color: media.coverImage?.color?.toColor(),
            mediaStatus: media.status ?? MediaStatus.$unknown,
            status: entry.status ?? MediaListStatus.$unknown,
            duration: media.duration,
            progress: entry.progress ?? 0,
            total: media.episodes ?? media.chapters ?? 0,
            score: entry.score,
            scoreFormat: scoreFormat,
            onPress: () => onEntryPress(entry),
            onEditPress: canEditEntries ? () => onEntryEditPress(entry) : null,
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: list.entries?.length ?? 0,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final entry = list.entries?[index];
          final media = entry?.media;

          if (entry == null || media == null) return Container();

          return ListEntryListTile(
            index: index,
            title: media.title?.userPreferred ?? '?',
            coverUrl: media.coverImage?.large,
            type: media.type ?? MediaType.$unknown,
            format: media.format ?? MediaFormat.$unknown,
            color: media.coverImage?.color?.toColor(),
            mediaStatus: media.status ?? MediaStatus.$unknown,
            status: entry.status ?? MediaListStatus.$unknown,
            duration: media.duration,
            progress: entry.progress ?? 0,
            total: media.episodes ?? media.chapters ?? 0,
            score: entry.score,
            scoreFormat: scoreFormat,
            onPress: () => onEntryPress(entry),
            onEditPress: canEditEntries ? () => onEntryEditPress(entry) : null,
            compact: displayType == ListDisplayType.listCompact,
          );
        },
      );
    }
  }
}
