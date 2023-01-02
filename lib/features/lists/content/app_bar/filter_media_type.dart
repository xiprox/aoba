import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/features/lists/lists_vm.dart';
import 'package:flextensions/flextensions.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

class MediaTypeFilter extends ViewModelWidget<ListsViewModel> {
  const MediaTypeFilter({super.key});

  @override
  Widget build(BuildContext context, ListsViewModel vm) {
    final theme = context.theme;
    final colors = context.colors;
    return SegmentedButton<MediaType>(
      showSelectedIcon: false,
      multiSelectionEnabled: false,
      selected: {vm.filterMediaType},
      onSelectionChanged: vm.data.isLoading
          ? null
          : (selection) => vm.onFilterMediaTypeChange(selection.first),
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        side: MaterialStateProperty.all(BorderSide(
          color: colors.outlineVariant,
        )),
        foregroundColor: MaterialStateProperty.all(colors.onBackground),
        textStyle: MaterialStateProperty.all(
          theme.textTheme.titleSmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: colors.onBackground,
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        )),
      ),
      segments: [
        ButtonSegment(
          value: MediaType.ANIME,
          label: Text(MediaType.ANIME.displayName),
        ),
        ButtonSegment(
          value: MediaType.MANGA,
          label: Text(MediaType.MANGA.displayName),
        ),
      ],
    );
  }
}
