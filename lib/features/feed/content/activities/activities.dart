import 'package:aoba/features/feed/data/feed_repo.dart';
import 'package:flutter/material.dart';

import 'list_activity/list_activity_tile.dart';
import 'text_activity/text_activity_tile.dart';

class Activities extends StatelessWidget {
  final List<Activity?> activities;

  const Activities({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final activity = activities[index];
          if (activity is TextActivity) {
            return TextActivityTile(
              activity: activity,
              onPress: () {},
              onUserPress: () {},
            );
          }
          if (activity is ListActivity) {
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
