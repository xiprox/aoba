import 'package:aoba/features/avatar/avatar_wrapper.dart';
import 'package:aoba/features/quick_update/quick_update_sheet.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content/activities.dart';
import 'feed_vm.dart';

class FeedPage extends ViewModelWidget<FeedViewModel> {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, FeedViewModel vm) {
    return Scaffold(
      body: CustomScrollView(
        controller: vm.scrollController,
        slivers: [
          SliverAppBar(
            leading: const AvatarWrapper(),
            titleSpacing: 0,
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
          if (vm.activities.isLoading())
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
          if (vm.activities.isError())
            SliverToBoxAdapter(child: Text(vm.activities.error!.message)),
          if (vm.activities.isSuccess())
            Activities(activities: vm.activities.data!),
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
