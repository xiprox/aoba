import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/features/feed/content/activities/activity_tile_base.dart';
import 'package:aoba/features/feed/data/feed_repo.dart';
import 'package:flextensions/extensions/build_context.dart';
import 'package:flutter/material.dart';

import 'media_cover.dart';
import 'status.dart';
import '../common/timestamp.dart';
import '../common/user.dart';

class ListActivityTile extends StatelessWidget {
  final ListActivity activity;

  final Function()? onPress;
  final Function()? onUserPress;
  final Function()? onMediaPress;

  const ListActivityTile({
    super.key,
    required this.activity,
    this.onPress,
    this.onUserPress,
    this.onMediaPress,
  });

  @override
  Widget build(BuildContext context) {
    final user = activity.user;
    final media = activity.media;
    final mediaColor = media?.coverImage?.color?.toColor();
    final mediaColorScheme = mediaColor == null
        ? null
        : ColorScheme.fromSeed(
            seedColor: mediaColor,
            brightness: context.theme.brightness,
          );
    return ActivityTileBase(
      onPress: onPress,
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 4),
                    User(
                      username: user?.name,
                      avatarUrl: user?.avatar?.medium,
                      profileColor: user?.options?.profileColor,
                      onPress: onUserPress,
                    ),
                    const SizedBox(width: 4),
                    Timestamp(timestamp: activity.createdAt * 1000 * 1000),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Status(
                    status: activity.status,
                    progress: activity.progress,
                    mediaTitle: media?.title?.userPreferred,
                    mediaColorScheme: mediaColorScheme,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(width: 16),
          MediaCover(
            url: media?.coverImage?.medium,
            type: media?.type,
          ),
        ],
      ),
    );
  }
}
