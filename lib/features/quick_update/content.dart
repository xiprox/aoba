import 'package:aoba/data/remote/gql/schema/schema.gql.dart';
import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/features/quick_update/quick_update_vm.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'entry/quick_update_entry.dart';

class Content extends ViewModelWidget<QuickUpdateViewModel> {
  const Content({super.key});

  @override
  Widget build(BuildContext context, QuickUpdateViewModel vm) {
    final entries = vm.entries.data?.Page?.entries ?? [];
    return ListView.separated(
      controller: vm.scrollController,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];
        final media = entry?.media;

        if (media == null) return Container();

        return QuickUpdateEntry(
          coverUrl: media.coverImage?.large ?? '',
          type: media.type == Enum$MediaType.ANIME
              ? ImageType.anime
              : ImageType.book,
          color: media.coverImage?.color?.toColor(),
          mediaType: media.type ?? Enum$MediaType.$unknown,
          airingAt: media.nextAiringEpisode?.airingAt,
          timeUntilAiring: media.nextAiringEpisode?.timeUntilAiring,
          airingEpisode: media.nextAiringEpisode?.episode,
          progress: entry?.progress,
          onIncrementPress: () {
            final newProgress = (entry?.progress ?? 0) + 1;
            vm.onIncrementEntryPress(media.id, newProgress);
          },
        );
      },
      separatorBuilder: ((context, index) {
        return const SizedBox(width: 8);
      }),
    );
  }
}
