import 'package:aoba/widgets/lists/media_list.dart';
import 'package:flutter/material.dart';

class DisplayTypeOption extends StatelessWidget {
  final ListDisplayType value;
  final ValueChanged<ListDisplayType> onChange;

  const DisplayTypeOption({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ListDisplayType>(
      showSelectedIcon: false,
      multiSelectionEnabled: false,
      selected: {value},
      onSelectionChanged: (selection) => onChange(selection.first),
      segments: const [
        ButtonSegment(
          value: ListDisplayType.grid,
          label: Icon(Icons.grid_view_rounded),
        ),
        ButtonSegment(
          value: ListDisplayType.listComfortable,
          label: Icon(Icons.view_list_rounded),
        ),
        ButtonSegment(
          value: ListDisplayType.listCompact,
          label: Icon(Icons.list_rounded),
        ),
      ],
    );
  }
}
