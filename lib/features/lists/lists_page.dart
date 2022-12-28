import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/lists/content/lists_content.dart';
import 'package:aoba/theme/theme.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'lists_vm.dart';

class ListsPage extends ViewModelWidget<ListsViewModel> {
  const ListsPage({super.key});

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
