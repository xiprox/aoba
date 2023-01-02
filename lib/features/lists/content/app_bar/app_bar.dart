import 'dart:math';

import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:aoba/features/lists/lists_vm.dart';
import 'package:aoba/widgets/lists/media_list.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:scroll_builder/scroll_builder.dart';

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

//+

  @override
  Widget build(BuildContext context, ListsViewModel vm) {
    final mediaQ = context.media;
    final theme = context.theme;
    final colors = context.colors;
    const expandedHeight = 188.0;
    const approximateWidthOfActions = 224.0;
    print('${mediaQ.size.width} - $approximateWidthOfActions');
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      actions: [
        IconButton(
          onPressed: () {
            if (vm.displayType == ListDisplayType.grid) {
              vm.onDisplayTypeChange(ListDisplayType.listComfortable);
            } else if (vm.displayType == ListDisplayType.listComfortable) {
              vm.onDisplayTypeChange(ListDisplayType.listCompact);
            } else if (vm.displayType == ListDisplayType.listCompact) {
              vm.onDisplayTypeChange(ListDisplayType.grid);
            }
          },
          icon: const Icon(Icons.tune_rounded),
        ),
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
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
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
                ],
              ),
      ),
    );
  }
}
