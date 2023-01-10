import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/entry_update/entry_update_form.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'content/header.dart';
import 'entry_updater_vm.dart';

class EntryUpdaterSheet extends ViewModelWidget<EntryUpdaterViewModel> {
  const EntryUpdaterSheet({super.key});

  @override
  Widget build(BuildContext context, EntryUpdaterViewModel vm) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final theme = AppTheme.override(context, vm.color);
    final colors = theme.colorScheme;

    const shape = SmoothRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    );
    return Theme(
      data: theme.copyWith(
        colorScheme: colors.copyWith(
          outline: colors.outline.withOpacity(0.5),
        ),
        textTheme: theme.textTheme.apply(
          bodyColor: colors.onSecondaryContainer,
          decorationColor: colors.secondary,
        ),
        sliderTheme: SliderThemeData(
          inactiveTrackColor: colors.secondary.withOpacity(0.2),
        ),
      ),
      child: Stack(
        children: [
          Material(
            color: colors.surfaceVariant,
            shape: shape,
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                Header(
                  borderRadius: shape.borderRadius,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: EntryUpdateForm(
                          mediaType: vm.mediaType,
                          initialStatus: vm.status,
                          scoreFormat: vm.scoreFormat,
                          initialScore: vm.score,
                          initialProgress: vm.progress,
                          maxPossibleProgress: vm.maxPossibleProgress,
                          initialStartDate: vm.startedAt,
                          initialCompleteDate: vm.completedAt,
                          initialRepeats: vm.repeats,
                          initialNotes: vm.notes,
                        ),
                      ),
                    ),
                    SizedBox(height: bottomInset),
                  ]),
                ),
              ],
            ),
          ),
          // ModalBottomSheet doesn't properly support dragging if the content
          // is scrollable. This hacky AbsorbPointer overlaid onto the title
          // portion of the header prevents the pointer events from reaching
          // the scroll content and thus allows the sheet to be dragged away.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 56),
            child: AbsorbPointer(
              absorbing: true,
              child: SizedBox(
                width: double.infinity,
                height: 56,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
