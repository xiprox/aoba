import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:collection/collection.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class StatusField extends StatelessWidget {
  final MediaType mediaType;
  final MediaListStatus? initialValue;

  const StatusField({
    super.key,
    required this.mediaType,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    final inputDecorationPadding = theme.inputDecorationTheme.contentPadding
        ?.resolve(Directionality.of(context));
    return DropdownButtonFormField(
      value: initialValue,
      elevation: 0,
      borderRadius: BorderRadius.circular(8),
      dropdownColor: colors.surfaceTone2,
      iconEnabledColor: colors.onSecondaryContainer,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 0,
          right: 8,
          top: inputDecorationPadding?.top ?? 16,
          bottom: inputDecorationPadding?.bottom ?? 16,
        ),
      ),
      items: MediaListStatus.values
          .whereNot((it) => it == MediaListStatus.$unknown)
          .map((it) {
        return DropdownMenuItem(
          value: it,
          child: Text(
            mediaType == MediaType.ANIME
                ? it.displayNameForAnime
                : mediaType == MediaType.MANGA
                    ? it.displayNameForManga
                    : it.displayName,
          ),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
