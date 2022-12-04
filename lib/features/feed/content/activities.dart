import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/features/feed/data/feed_repo.dart';
import 'package:flutter/material.dart';

import '../../../widgets/feed/activity/list_activity/list_activity_tile.dart';
import '../../../widgets/feed/activity/text_activity/text_activity_tile.dart';

class Activities extends StatelessWidget {
  final List<Activity?> activities;
  final Function(int id, Color? color)? onUserPress;

  const Activities({
    super.key,
    required this.activities,
    this.onUserPress,
  });

  void _onUserPress(int? id, Color? color) {
    if (id != null) {
      onUserPress?.call(id, color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final activity = activities[index];
          if (activity is TextActivity) {
            final user = activity.user;
            final userColor = user?.options?.profileColor?.fromAniListColor();
            return TextActivityTile(
              username: user?.name,
              userAvatarUrl: user?.avatar?.medium,
              userColor: userColor,
              content: activity.text,
              createdAt: activity.createdAt,
              onPress: () {},
              onUserPress: () => _onUserPress(user?.id, userColor),
            );
          }
          if (activity is ListActivity) {
            final media = activity.media;
            final user = activity.user;
            final userColor = user?.options?.profileColor?.fromAniListColor();
            return ListActivityTile(
              username: user?.name,
              userAvatarUrl: user?.avatar?.medium,
              userColor: userColor,
              status: activity.status,
              progress: activity.progress,
              mediaTitle: media?.title?.userPreferred,
              mediaCoverUrl: media?.coverImage?.medium,
              mediaType: media?.type,
              mediaColor: media?.coverImage?.color?.toColor(),
              createdAt: activity.createdAt,
              onPress: () {},
              onMediaPress: () {},
              onUserPress: () => _onUserPress(user?.id, userColor),
            );
          }
          return null;
        },
        childCount: activities.length,
      ),
    );
  }
}
