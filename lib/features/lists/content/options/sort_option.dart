import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/extensions.dart';
import 'package:flextensions/extensions/build_context.dart';
import 'package:flutter/material.dart';

const _kAvailableSortOptions = [
  MediaListSort.SCORE,
  MediaListSort.PROGRESS,
  MediaListSort.UPDATED_TIME,
  MediaListSort.ADDED_TIME,
  MediaListSort.STARTED_ON,
  MediaListSort.FINISHED_ON,
  MediaListSort.MEDIA_POPULARITY,
  MediaListSort.REPEAT,
];

class SortOption extends StatefulWidget {
  final MediaListSort titleSortOption;
  final MediaListSort value;
  final ValueChanged<MediaListSort> onChange;

  const SortOption({
    super.key,
    required this.titleSortOption,
    required this.value,
    required this.onChange,
  });

  @override
  State<SortOption> createState() => _SortOptionState();
}

class _SortOptionState extends State<SortOption> {
  late bool descending = widget.value.desc;

  void _onSortChange(MediaListSort value) {
    widget.onChange(value.withOrder(descending: descending));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final inputDecorationPadding = theme.inputDecorationTheme.contentPadding
        ?.resolve(Directionality.of(context));
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<MediaListSort>(
            value: widget.value.withoutOrder(),
            elevation: 0,
            borderRadius: BorderRadius.circular(8),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                left: 0,
                right: 8,
                top: inputDecorationPadding?.top ?? 16,
                bottom: inputDecorationPadding?.bottom ?? 16,
              ),
            ),
            items:
                [widget.titleSortOption, ..._kAvailableSortOptions].map((it) {
              return DropdownMenuItem<MediaListSort>(
                value: it,
                child: Text(it.displayName),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                _onSortChange(value);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        IconButton.outlined(
          onPressed: () {
            // No need to set state as the widget will be rebuilt due to [value]
            // change.
            descending = !descending;
            _onSortChange(widget.value);
          },
          icon: Icon(
            descending
                ? Icons.arrow_downward_rounded
                : Icons.arrow_upward_rounded,
          ),
        ),
      ],
    );
  }
}
