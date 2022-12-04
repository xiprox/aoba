import 'package:aoba/consts/consts.dart';
import 'package:aoba/features/avatar/avatar_wrapper.dart';
import 'package:aoba/features/quick_update/quick_update_sheet.dart';
import 'package:aoba/mixins/snackbar_mixin.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content/activities.dart';
import 'feed_vm.dart';

class FeedPage extends ViewModelWidget<FeedViewModel>
    with SnackBarMixin, SnackBarInViewModelWidgetMixin<FeedViewModel> {
  const FeedPage({super.key});

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    FeedViewModel vm,
  ) {
    super.handleOrder(context, order, vm);
    if (order is OpenProfile) {
      context.router.navigate(
        ProfileRoute(userId: order.userId, color: order.color),
      );
    }
  }

  @override
  Widget build(BuildContext context, FeedViewModel vm) {
    return Scaffold(
      body: CustomScrollView(
        controller: vm.scrollController,
        slivers: [
          SliverAppBar(
            leading: AvatarWrapper(onPress: vm.onProfilePress),
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
            SliverToBoxAdapter(
              child: Text(
                vm.activities.error!.message ?? kDefaultUnknownErrorText,
              ),
            ),
          if (vm.activities.isSuccess())
            Activities(
              activities: vm.activities.data!,
              onUserPress: vm.onUserPress,
            ),
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
