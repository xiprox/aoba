import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/features/feed/data/feed_repo.dart';
import 'package:aoba/utils/anilist_utils.dart';
import 'package:flutter/material.dart';

import '../../../widgets/feed/activity/list_activity/list_activity_tile.dart';
import '../../../widgets/feed/activity/text_activity/text_activity_tile.dart';

class Activities extends StatelessWidget {
  final List<Activity?> activities;
  final Function(int id)? onUserPress;

  const Activities({
    super.key,
    required this.activities,
    this.onUserPress,
  });

  void _onUserPress(int? id) {
    if (id != null) {
      onUserPress?.call(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final activity = activities[index];
          if (activity is TextActivity) {
            return TextActivityTile(
              username: activity.user?.name,
              userAvatarUrl: activity.user?.avatar?.medium,
              userColor: AniListUtils().colorFromProfileColor(
                activity.user?.options?.profileColor,
              ),
              content: activity.text,
              createdAt: activity.createdAt,
              onPress: () {},
              onUserPress: () => _onUserPress(activity.user?.id),
            );
          }
          if (activity is ListActivity) {
            final media = activity.media;
            return ListActivityTile(
              username: activity.user?.name,
              userAvatarUrl: activity.user?.avatar?.medium,
              userColor: AniListUtils().colorFromProfileColor(
                activity.user?.options?.profileColor,
              ),
              status: activity.status,
              progress: activity.progress,
              mediaTitle: media?.title?.userPreferred,
              mediaCoverUrl: media?.coverImage?.medium,
              mediaType: media?.type,
              mediaColor: media?.coverImage?.color?.toColor(),
              createdAt: activity.createdAt,
              onPress: () {},
              onMediaPress: () {},
              onUserPress: () => _onUserPress(activity.user?.id),
            );
          }
          return null;
        },
        childCount: activities.length,
      ),
    );
  }
}
