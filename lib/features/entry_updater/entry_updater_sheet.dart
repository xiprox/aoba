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
            shape: shape,
            color: colors.surfaceVariant,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: Header.kHeight + 16,
                  right: 16,
                  bottom: 16,
                ),
                child: SafeArea(
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
            ),
          ),
          Header(
            borderRadius: shape.borderRadius,
          ),
        ],
      ),
    );
  }
}
