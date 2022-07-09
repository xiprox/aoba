import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'activities/activities.dart';
import 'feed_vm.dart';

class FeedPage extends ViewModelWidget<FeedViewModel> with InfiniteScrollMixin {
  FeedPage({super.key});

  @override
  double get infiniteScrollTriggerWindow => 200;

  @override
  Widget build(BuildContext context, FeedViewModel vm) {
    return Scaffold(
      body: CustomScrollView(
        controller: infiniteScroll(vm.onShouldFetchNextPage),
        slivers: [
          const SliverPadding(padding: EdgeInsets.only(bottom: 4)),
          if (vm.initialResource.isLoading())
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
          if (vm.initialResource.isError())
            SliverToBoxAdapter(child: Text(vm.initialResource.error!.message)),
          if (vm.initialResource.isSuccess())
            Activities(activities: vm.activities),
          const SliverPadding(padding: EdgeInsets.only(bottom: 4)),
        ],
      ),
    );
  }
}
