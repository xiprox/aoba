import 'package:aoba/data/remote/gql/schema/schema.graphql.dart';
import 'package:aoba/features/quick_update/quick_update_vm.dart';
import 'package:aoba/widgets/expandable_sheet/expandable_sheet.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'entry/quick_update_entry.dart';

class QuickUpdateSheet extends ViewModelWidget<QuickUpdateViewModel> {
  const QuickUpdateSheet({Key? key}) : super(key: key);

  static const kCollapsedHeight = 56.0;

  @override
  Widget build(BuildContext context, QuickUpdateViewModel vm) {
    final anime = vm.entries.data?.Page?.anime ?? [];
    final manga = vm.entries.data?.Page?.manga ?? [];
    final combined = [...anime, ...manga];

    const entryHeight = QuickUpdateEntry.kDesiredHeight;
    const contentHeight = entryHeight;

    return ExpandableSheet(
      maxHeight: vm.entries.isLoading() ? 80 : contentHeight - 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Quick Update',
              style: context.theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(
            height: contentHeight,
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: combined.length,
              itemBuilder: (context, index) {
                final entry = combined[index];
                final media = entry?.media;

                if (media == null) return Container();

                return QuickUpdateEntry(
                  coverUrl: media.coverImage?.large ?? '',
                  type: media.type == Enum$MediaType.ANIME
                      ? ImageType.anime
                      : ImageType.book,
                );
              },
              separatorBuilder: ((context, index) {
                return const SizedBox(width: 8);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
