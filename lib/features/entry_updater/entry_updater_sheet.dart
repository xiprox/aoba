import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/theme/theme.dart';
import 'package:aoba/widgets/entry_update/entry_update_form.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:aoba/widgets/wave_border/wave_border.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

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
      child: Material(
        color: colors.surfaceVariant,
        shape: shape,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            if (vm.bannerImage != null) ...[
              LayoutBuilder(builder: (context, constraints) {
                return NetworkImageWithPlaceholder(
                  type: ImageType.banner,
                  url: vm.bannerImage,
                  color: colors.secondaryContainer.manipulate(0.9),
                  height: constraints.maxWidth / AspectRatios.banner,
                  width: constraints.maxWidth,
                  shape: WaveBorder(
                    side: const WaveSide.only(
                      bottom: Wave(
                        amplitude: 4,
                        wavelength: 24,
                      ),
                    ),
                    borderRadius: shape.borderRadius,
                  ),
                );
              }),
            ],
            if (vm.title != null) ...[
              SizedBox(height: vm.bannerImage == null ? 16 : 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  vm.title!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    color: colors.primary,
                  ),
                ),
              ),
            ],
            Padding(
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
          ],
        ),
      ),
    );
  }
}
