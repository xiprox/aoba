import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/data/lists_repo.dart';
import 'package:flutter/material.dart';

class ListsTabs extends StatelessWidget {
  final List<MediaList?> lists;
  final TabController controller;

  const ListsTabs({
    super.key,
    required this.controller,
    required this.lists,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: controller,
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
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
                (it) => Text(it?.name ?? '?', key: ValueKey(it.hashCode)),
              )
              .toList(),
        ),
      ],
    );
  }
}
