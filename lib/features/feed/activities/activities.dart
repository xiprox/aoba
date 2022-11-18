import 'package:aoba/features/feed/feed.gql.dart';
import 'package:flutter/material.dart';

import 'list_activity/list_activity_tile.dart';
import 'text_activity/text_activity_tile.dart';

class Activities extends StatelessWidget {
  final List<Query$FetchFeed$Page$activities?> activities;

  const Activities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final activity = activities[index];
          if (activity is Query$FetchFeed$Page$activities$$TextActivity) {
            return TextActivityTile(
              activity: activity,
              onPress: () {},
              onUserPress: () {},
            );
          }
          if (activity is Query$FetchFeed$Page$activities$$ListActivity) {
            return ListActivityTile(
              activity: activity,
              onPress: () {},
              onMediaPress: () {},
              onUserPress: () {},
            );
          }
          return null;
        },
        childCount: activities.length,
      ),
    );
  }
}
