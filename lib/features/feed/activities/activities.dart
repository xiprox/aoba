import 'package:aoba/data/remote/gql/queries/feed/feed.graphql.dart';
import 'package:flutter/material.dart';

import 'list_activities/list_activity_tile.dart';

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
            return ListTile(
              title: Text(activity.user?.name ?? '?'),
              subtitle: Text(activity.text ?? '?'),
            );
          }
          if (activity is Query$FetchFeed$Page$activities$$ListActivity) {
            return ListActivityTile(
              activity: activity,
              onMediaPress: () {
                print('woasdad');
              },
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
