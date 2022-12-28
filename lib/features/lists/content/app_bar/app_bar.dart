import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:aoba/features/lists/lists_vm.dart';
import 'package:flutter/material.dart';

import 'package:veee/veee.dart';

import 'filter_media_type.dart';
import 'tabs_loading_state.dart';

class ListsAppBar extends ViewModelWidget<ListsViewModel> {
  final List<MediaList?> lists;
  final TabController tabController;

  const ListsAppBar({
    super.key,
    required this.lists,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context, ListsViewModel vm) {
    final colors = context.colors;
    return SliverAppBar(
      pinned: true,
      title: Text(vm.appBarTitle),
      actions: const [
        MediaTypeFilter(),
        SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 48),
        child: vm.data.isLoading
            ? const TabsLoadingState()
            : Column(children: [
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  splashBorderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: colors.primary, width: 2),
                  ),
                  dividerColor: Colors.transparent,
                  tabs: lists
                      .map(
                        (it) =>
                            Text(it?.name ?? '?', key: ValueKey(it.hashCode)),
                      )
                      .toList(),
                ),
              ]),
      ),
    );
  }
}
