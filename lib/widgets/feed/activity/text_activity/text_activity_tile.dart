import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/feed/activity/activity_tile_base.dart';
import 'package:aoba/widgets/feed/activity/common/timestamp.dart';
import 'package:aoba/widgets/feed/activity/common/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TextActivityTile extends StatelessWidget {
  final String? username;
  final String? userAvatarUrl;
  final Color? userColor;
  final String? content;
  final int createdAt;

  final Function()? onPress;
  final Function()? onUserPress;

  const TextActivityTile({
    super.key,
    this.username,
    this.userAvatarUrl,
    this.userColor,
    this.content,
    this.createdAt = 0,
    this.onPress,
    this.onUserPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
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
                Html(
                  data: content,
                  onLinkTap: (link, _, __, ___) => launchUrlString(link ?? '#'),
                  style: {
                    'body': Style(
                      fontSize: FontSize(14),
                      color: colors.onSurface,
                    ),
                  },
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
