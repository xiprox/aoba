import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/feed/activity/activity_tile_base.dart';
import 'package:flextensions/extensions/build_context.dart';
import 'package:flutter/material.dart';

import 'media_cover.dart';
import 'status.dart';
import '../common/timestamp.dart';
import '../common/user.dart';

class ListActivityTile extends StatelessWidget {
  final String? username;
  final String? userAvatarUrl;
  final Color? userColor;
  final String? status;
  final String? progress;
  final String? mediaTitle;
  final String? mediaCoverUrl;
  final MediaType? mediaType;
  final Color? mediaColor;
  final int createdAt;

  final Function()? onPress;
  final Function()? onUserPress;
  final Function()? onMediaPress;

  const ListActivityTile({
    super.key,
    this.username,
    this.userAvatarUrl,
    this.userColor,
    this.status,
    this.progress,
    this.mediaTitle,
    this.mediaCoverUrl,
    this.mediaType,
    this.mediaColor,
    this.onPress,
    this.onUserPress,
    this.onMediaPress,
    this.createdAt = 0,
  });

  @override
  Widget build(BuildContext context) {
    final mediaColorScheme = mediaColor == null
        ? null
        : ColorScheme.fromSeed(
            seedColor: mediaColor!,
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
                      username: username,
                      avatarUrl: userAvatarUrl,
                      color: userColor,
                      onPress: onUserPress,
                    ),
                    const SizedBox(width: 4),
                    Timestamp(timestamp: createdAt * 1000 * 1000),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8),
                  child: Status(
                    status: status,
                    progress: progress,
                    mediaTitle: mediaTitle,
                    mediaColorScheme: mediaColorScheme,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(width: 16),
          MediaCover(
            url: mediaCoverUrl,
            type: mediaType,
          ),
        ],
      ),
    );
  }
}
