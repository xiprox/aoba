import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/data/model/entry_update_data.dart';
import 'package:aoba/features/entry_updater/entry_updater.dart';
import 'package:aoba/features/lists/content/lists_content.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/popup_on_position/route.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content/options/popup_content.dart';
import 'data/lists_repo.dart';
import 'lists_vm.dart';

class ListsPage extends ViewModelWidget<ListsViewModel> {
  const ListsPage({super.key});

  @override
  void handleOrder(
      BuildContext context, ViewModelOrder order, ListsViewModel vm) {
    super.handleOrder(context, order, vm);
    if (order is OpenOptions) {
      _openOptions(context, order, vm);
    }
    if (order is OpenEntryUpdate) {
      _openEntryUpdate(context, order, vm);
    }
  }

  void _openOptions(
    BuildContext context,
    OpenOptions order,
    ListsViewModel vm,
  ) {
    context.router.pushNativeRoute(PopupOnPositionRoute(
      position: order.triggerPosition.translate(
        -ListsOptionsPopupContent.kWidth / 2,
        32,
      ),
      triggerPosition: order.triggerPosition,
      child: ListsOptionsPopupContent(vm: vm),
    ));
  }

  void _openEntryUpdate(
    BuildContext context,
    OpenEntryUpdate order,
    ListsViewModel vm,
  ) {
    final entry = order.entry;
    final mediaId = entry.media?.id;
    if (mediaId == null) {
      return;
    }
    EntryUpdater.show(
      context,
      mediaId: mediaId,
      mediaType: entry.media?.type ?? MediaType.$unknown,
      title: entry.media?.title?.userPreferred,
      maxProgress: entry.media?.episodes ?? entry.media?.chapters,
      scoreFormat: order.scoreFormat,
      color: order.color,
      data: EntryUpdateData(
        status: entry.status,
        score: entry.score,
        progress: entry.progress,
        startedAt: entry.startedAt?.toDateTime(),
        completedAt: entry.completedAt?.toDateTime(),
        repeats: entry.repeat,
        notes: entry.notes,
      ),
    );
  }

  @override
  Widget build(BuildContext context, ListsViewModel vm) {
    final theme = AppTheme.override(context, vm.color);
    return Theme(
      data: theme,
      child: Scaffold(
        body: ListsContent(
          initialIndex: vm.filterMediaType == MediaType.ANIME
              ? vm.animeIndex
              : vm.mangaIndex,
          onTabChanged: vm.onTabChanged,
          data: vm.data,
        ),
      ),
    );
  }
}
