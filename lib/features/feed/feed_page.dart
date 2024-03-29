import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/user_box/user_box_wrapper.dart';
import 'package:aoba/mixins/snackbar_mixin.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:flextensions/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content/activities.dart';
import 'content/error_state/error_state.dart';
import 'content/loading_state/loading_state.dart';
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
    final theme = context.theme;
    final colors = context.colors;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: vm.onPulledToRefresh,
        displacement: context.media.padding.top + 56 + 16,
        backgroundColor: colors.secondaryContainer,
        child: CustomScrollView(
          controller: vm.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: UserBoxWrapper(onPress: vm.onProfilePress),
              titleSpacing: 0,
              title: GestureDetector(
                // Temporary during development.
                child: Text(
                  vm.followingOnly ? 'My Feed' : 'Global Feed',
                  style: theme.textTheme.titleLarge,
                ),
                onTap: () => vm.onFollowingOnlyChange(!vm.followingOnly),
              ),
              floating: true,
              snap: true,
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 4)),
            ResourceBuilder(
              resource: vm.activities,
              loadingBuilder: (context, data) {
                return const SliverToBoxAdapter(child: LoadingState());
              },
              errorBuilder: (context, error, data) {
                return ErrorState(error: error);
              },
              contentBuilder: (context, data) {
                return Activities(
                  activities: vm.activities.data!,
                  onUserPress: vm.onUserPress,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
