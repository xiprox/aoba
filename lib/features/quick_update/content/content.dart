import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/features/quick_update/quick_update_vm.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'entry/quick_update_entry_tile.dart';

/// The horizontal empty space between each [QuickUpdateEntryTile].
const _kTileSpacing = 8.0;

class Content extends ViewModelWidget<QuickUpdateViewModel> {
  const Content({super.key});

  @override
  Widget build(BuildContext context, QuickUpdateViewModel vm) {
    final entries = vm.entries.data ?? [];
    return ListView.separated(
      controller: vm.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        final media = entry.media;

        if (media == null) return Container();

        final updateResult = vm.updatedEntries[media.id];
        final loading = updateResult?.isLoading == true;
        final error = updateResult?.error;

        // Use the updated progress if it exists.
        final progress = updateResult?.data?.progress ?? entry.progress;

        return QuickUpdateEntryTile(
          coverUrl: media.coverImage?.large ?? '',
          type: media.type?.toImageType() ?? ImageType.generic,
          color: media.coverImage?.color?.toColor(),
          mediaType: media.type ?? MediaType.$unknown,
          airingAt: media.nextAiringEpisode?.airingAt,
          timeUntilAiring: media.nextAiringEpisode?.timeUntilAiring,
          airingEpisode: media.nextAiringEpisode?.episode,
          progress: progress,
          error: error?.message,
          loading: loading,
          onIncrementPress: () {
            final newProgress = (progress ?? 0) + 1;
            vm.onIncrementEntryPress(media.id, newProgress);
          },
        );
      },
      separatorBuilder: ((context, index) {
        return const SizedBox(width: _kTileSpacing);
      }),
    );
  }
}
