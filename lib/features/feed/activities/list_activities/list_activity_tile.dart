import 'package:aoba/data/remote/gql/queries/feed/feed.graphql.dart';
import 'package:aoba/data/remote/gql/schema/schema.graphql.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/utils/anilist_utils.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flextensions/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:stringr/stringr.dart';

class ListActivityTile extends StatelessWidget {
  final Query$FetchFeed$Page$activities$$ListActivity activity;

  final Function()? onUserPress;
  final Function()? onMediaPress;

  const ListActivityTile({
    super.key,
    required this.activity,
    this.onUserPress,
    this.onMediaPress,
  });

  @override
  Widget build(BuildContext context) {
    final user = activity.user;
    final media = activity.media;
    final timestamp =
        DateTime.fromMicrosecondsSinceEpoch(activity.createdAt * 1000 * 1000);
    final userColorRaw = user?.options?.profileColor;
    final userColor = AniListUtils().colorFromProfileColor(userColorRaw);
    final userColorScheme = userColor == null || userColorRaw == 'blue'
        ? null
        : ColorScheme.fromSeed(
            seedColor: userColor,
            brightness: context.theme.brightness,
          );
    final mediaColor = media?.coverImage?.color?.toColor();
    final mediaColorScheme = mediaColor == null
        ? null
        : ColorScheme.fromSeed(
            seedColor: mediaColor,
            brightness: context.theme.brightness,
          );
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: onUserPress,
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                NetworkImageWithPlaceholder(
                                  key: ValueKey(user?.avatar?.medium),
                                  url: user?.avatar?.medium,
                                  type: ImageType.user,
                                  width: 24,
                                  height: 24,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  user?.name ?? '?',
                                  style: TextStyle(
                                    color: userColorScheme?.primary ??
                                        context.colors.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          timestamp.relative(
                            appendIfAfter: 'ago',
                            prependIfBefore: 'in',
                          ),
                          style: TextStyle(
                            color: context.colors.onSurfaceVariant
                                .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 8),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: activity.status?.capitalize() ?? '?'),
                            const TextSpan(text: ' '),
                            TextSpan(text: activity.progress ?? ''),
                            if (activity.progress != null)
                              const TextSpan(text: ' of '),
                            TextSpan(
                              text: media?.title?.userPreferred ?? '?',
                              style: TextStyle(
                                color: mediaColorScheme?.secondary ??
                                    context.colors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              NetworkImageWithPlaceholder(
                key: ValueKey(media?.coverImage?.medium),
                url: media?.coverImage?.medium,
                type: media?.type == Enum$MediaType.ANIME
                    ? ImageType.anime
                    : ImageType.book,
                width: 72 * 0.6415620642,
                height: 72,
                // borderRadius: BorderRadius.circular(16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
