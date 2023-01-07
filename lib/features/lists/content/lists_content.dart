import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:aoba/features/lists/lists_vm.dart';
import 'package:aoba/features/profile/content/error_state/error_state.dart';
import 'package:aoba/widgets/lists/media_list.dart';
import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:aoba/widgets/resource_builder_animated_switcher/resource_builder_animated_switcher.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'app_bar/app_bar.dart';
import 'loading_state/loading_state.dart';

class ListsContent extends StatefulWidget {
  final int initialIndex;
  final Resource<ListsData> data;
  final Function(int index) onTabChanged;

  const ListsContent({
    super.key,
    required this.initialIndex,
    required this.data,
    required this.onTabChanged,
  });

  List<MediaList?> get lists => data.data?.lists.orEmpty().toList() ?? [];

  @override
  State<ListsContent> createState() => _ListsContentState();
}

class _ListsContentState extends State<ListsContent>
    with TickerProviderStateMixin {
  late var tabController = _newTabController();

  TabController _newTabController() {
    final length = widget.lists.length;
    final controller = TabController(
      length: length,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    controller.addListener(onTabChanged);
    return controller;
  }

  void onTabChanged() {
    widget.onTabChanged(tabController.index);
  }

  @override
  void didUpdateWidget(covariant ListsContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialIndex != oldWidget.initialIndex ||
        widget.data != oldWidget.data) {
      tabController.removeListener(onTabChanged);
      tabController = _newTabController();
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.vm<ListsViewModel>(listen: true);
    return NestedScrollView(
      controller: vm.scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          ListsAppBar(
            lists: widget.lists,
            tabController: tabController,
          ),
        ];
      },
      body: ResourceBuilderAnimatedSwitcher(
        child: ResourceBuilder(
          key: ValueKey(
            widget.data.hashCode ^ vm.optionDisplayType.hashCode,
          ),
          loadingBuilder: (context, data) => const LoadingState(),
          errorBuilder: (context, error, _) => ErrorState(error: error),
          resource: widget.data,
          contentBuilder: (context, data) {
            return TabBarView(
              controller: tabController,
              children: widget.lists.map((list) {
                if (list == null) return Container();
                return MediaListView(
                  key: ValueKey(list.hashCode),
                  scoreFormat:
                      widget.data.data?.user?.mediaListOptions?.scoreFormat ??
                          ScoreFormat.$unknown,
                  type: vm.filterMediaType,
                  onEntryPress: vm.onEntryPress,
                  canEditEntries: vm.canEditEntries,
                  onEntryEditPress: vm.onEntryEditPress,
                  displayType: vm.optionDisplayType,
                  list: list,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
