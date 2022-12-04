import 'package:aoba/consts/consts.dart';
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
    return Theme(
      data: AppTheme.override(context, vm.color),
      child: Scaffold(
        body: CustomScrollView(
          controller: vm.scrollController,
          slivers: [
            SliverAppBar(
              titleSpacing: 0,
              title: Text(vm.info.data?.name ?? ''),
              // floating: true,
              // snap: true,
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
              Activities(activities: vm.activities.data!),
          ],
        ),
      ),
    );
  }
}
