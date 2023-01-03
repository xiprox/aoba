import 'dart:math';

import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/content/app_bar/tabs.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:aoba/features/lists/lists_vm.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:scroll_builder/scroll_builder.dart';

import 'package:veee/veee.dart';

import 'filter_media_type.dart';
import 'options_action.dart';
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
    final mediaQ = context.media;
    final theme = context.theme;
    const expandedHeight = 188.0;
    const approximateWidthOfActions = 224.0;
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      actions: [
        OptionsAction(onPress: (position) => vm.onOptionsPress(position)),
        const SizedBox(width: 4),
        const MediaTypeFilter(),
        const SizedBox(width: 8),
      ],
      flexibleSpace: FlexibleSpaceBar.createSettings(
        currentExtent: 1,
        child: ScrollBuilder(
          scrollController: vm.scrollController,
          breakpoint: expandedHeight / 2,
          delegate: ScrollBuilderCustomDelegate(
            builder: (percentage, child) {
              return Padding(
                padding: EdgeInsetsDirectional.only(
                  start: Tween(begin: 16.0, end: 56.0).transform(percentage),
                  top: mediaQ.padding.top +
                      Tween(
                        begin: expandedHeight - 96.0,
                        end: 14.0,
                      ).transform(percentage),
                ),
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: Tween(
                          begin: mediaQ.size.width,
                          end: max(
                            0.0,
                            mediaQ.size.width - approximateWidthOfActions,
                          ),
                        ).transform(
                          const Interval(0.0, 0.8).transform(percentage),
                        ),
                      ),
                      child: Text(
                        vm.appBarTitle,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: Tween(
                            begin: 28.0,
                            end: theme.textTheme.titleLarge?.fontSize,
                          ).transform(percentage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 48),
        child: vm.data.isLoading
            ? const TabsLoadingState()
            : ListsTabs(controller: tabController, lists: lists),
      ),
    );
  }
}
