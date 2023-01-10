import 'package:aoba/features/entry_updater/entry_updater_vm.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/widgets/wave_border/wave_border.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

class Header extends ViewModelWidget<EntryUpdaterViewModel> {
  final BorderRadiusGeometry borderRadius;

  const Header({
    super.key,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context, EntryUpdaterViewModel vm) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    return SliverAppBar(
      backgroundColor: colors.secondary,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      foregroundColor: colors.onSecondary,
      title: vm.title == null
          ? null
          : Text(
              vm.title!,
              overflow: TextOverflow.fade,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 20,
                color: colors.onSecondary,
              ),
            ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: context.router.pop,
      ),
      shape: WaveBorder(
        side: const WaveSide.only(
          bottom: Wave(
            amplitude: 3,
            wavelength: 24,
          ),
        ),
        borderRadius: borderRadius,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: vm.onSavePress,
        ),
      ],
    );
  }
}
