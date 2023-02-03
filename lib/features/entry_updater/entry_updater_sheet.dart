import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/entry_update/entry_update_form.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content/error_box.dart';
import 'content/header.dart';
import 'entry_updater_vm.dart';

class EntryUpdaterSheet extends ViewModelWidget<EntryUpdaterViewModel> {
  const EntryUpdaterSheet({super.key});

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    EntryUpdaterViewModel vm,
  ) {
    super.handleOrder(context, order, vm);
    if (order is Close) {
      context.router.pop();
    }
  }

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
          bodyColor: colors.onSurfaceVariant,
          displayColor: colors.onSurfaceVariant,
          decorationColor: colors.secondary,
        ),
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          suffixStyle: TextStyle(
            color: colors.onSurfaceVariant.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
        sliderTheme: SliderThemeData(
          inactiveTrackColor: colors.primary.withOpacity(0.2),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ErrorBox(error: vm.error?.message),
                      EntryUpdateForm(
                        enabled: !vm.isBusy,
                        mediaType: vm.mediaType,
                        scoreFormat: vm.scoreFormat,
                        maxProgress: vm.maxProgress,
                        initialData: vm.initialFormData,
                        onStatusChange: vm.onStatusChange,
                        onScoreChange: vm.onScoreChange,
                        onProgressChange: vm.onProgressChange,
                        onRepeatsChange: vm.onRepeatsChange,
                        onStartedAtChange: vm.onStartedAtChange,
                        onCompletedAtChange: vm.onCompletedAtChange,
                        onNotesChange: vm.onNotesChange,
                      ),
                    ],
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
