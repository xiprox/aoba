import 'package:aoba/features/feed/activities/activity_tile_base.dart';
import 'package:aoba/features/feed/activities/common/timestamp.dart';
import 'package:aoba/features/feed/activities/common/user.dart';
import 'package:aoba/features/feed/feed.gql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TextActivityTile extends StatelessWidget {
  final Query$FetchFeed$Page$activities$$TextActivity activity;

  final Function()? onPress;
  final Function()? onUserPress;

  const TextActivityTile({
    super.key,
    required this.activity,
    this.onPress,
    this.onUserPress,
  });

  @override
  Widget build(BuildContext context) {
    final user = activity.user;
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
                Html(
                  data: activity.text,
                  onLinkTap: (link, _, __, ___) => launchUrlString(link ?? '#'),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
