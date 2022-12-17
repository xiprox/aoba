import 'package:aoba/features/profile/content/app_bar/app_bar.dart';
import 'package:aoba/mixins/snackbar_mixin.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'content/activities.dart';
import 'content/error_state/error_state.dart';
import 'content/loading_state/loading_state.dart';
import 'profile_vm.dart';

class ProfilePage extends ViewModelWidget<ProfileViewModel>
    with SnackBarMixin, SnackBarInViewModelWidgetMixin<ProfileViewModel> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel vm) {
    final theme = AppTheme.override(context, vm.color);
    return Theme(
      data: theme,
      child: Scaffold(
        body: CustomScrollView(
          controller: vm.scrollController,
          slivers: [
            const ProfileAppBar(),
            const SliverPadding(padding: EdgeInsets.only(bottom: 8)),
            ResourceBuilder(
              resource: vm.activities.combineStatus(vm.info),
              loadingBuilder: (context, data) {
                return const SliverToBoxAdapter(child: LoadingState());
              },
              errorBuilder: (context, error, data) {
                return ErrorState(error: error);
              },
              contentBuilder: (context, data) {
                return Activities(activities: vm.activities.data!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
