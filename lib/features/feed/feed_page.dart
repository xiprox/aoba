import 'package:aoba/features/quick_update/quick_update_sheet.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'activities/activities.dart';
import 'feed_vm.dart';

class FeedPage extends ViewModelWidget<FeedViewModel> with InfiniteScrollMixin {
  FeedPage({super.key});

  @override
  Widget build(BuildContext context, FeedViewModel vm) {
    return Scaffold(
      body: CustomScrollView(
        controller: infiniteScroll(vm.onShouldFetchNextPage),
        slivers: [
          SliverAppBar(
            title: Text(vm.followingOnly ? 'My Feed' : 'Global Feed'),
            floating: true,
            snap: true,
            actions: [
              IconButton(
                icon: Icon(vm.followingOnly
                    ? Icons.public_rounded
                    : Icons.public_off_rounded),
                onPressed: () => vm.onFollowingOnlyChange(!vm.followingOnly),
              ),
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                onPressed: vm.onLogoutPress,
              ),
            ],
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 4)),
          if (vm.initialResource.isLoading())
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
          if (vm.initialResource.isError())
            SliverToBoxAdapter(child: Text(vm.initialResource.error!.message)),
          if (vm.initialResource.isSuccess())
            Activities(activities: vm.activities),
          const SliverPadding(
            padding: EdgeInsets.only(
              bottom: QuickUpdateSheet.kCollapsedHeight + 4,
            ),
          ),
        ],
      ),
    );
  }
}
