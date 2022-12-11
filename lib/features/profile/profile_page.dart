import 'package:aoba/consts/consts.dart';
import 'package:aoba/features/profile/content/app_bar/app_bar.dart';
import 'package:aoba/mixins/snackbar_mixin.dart';
import 'package:aoba/theme/theme.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'content/activities.dart';
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
            if (vm.activities.isLoading)
              const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            if (vm.activities.error != null)
              SliverToBoxAdapter(
                child: Text(
                  vm.activities.error!.message ?? kDefaultUnknownErrorText,
                ),
              ),
            if (vm.activities.data != null)
              Activities(activities: vm.activities.data!),
          ],
        ),
      ),
    );
  }
}
