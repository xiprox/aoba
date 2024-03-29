import 'package:aoba/features/entry_updater/entry_updater_vm.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/widgets/wave_border/wave_border.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

class Header extends ViewModelWidget<EntryUpdaterViewModel> {
  static const kHeight = 56.0;

  final BorderRadiusGeometry borderRadius;

  const Header({
    super.key,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context, EntryUpdaterViewModel vm) {
    final theme = context.theme;
    final colors = theme.colorScheme;
    return SizedBox(
      height: kHeight,
      child: AppBar(
        backgroundColor: colors.secondary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colors.onSecondary,
        title: vm.title == null
            ? null
            : Text(
                vm.title!,
                maxLines: 2,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: colors.onSecondary,
                    fontWeight: FontWeight.w500),
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
      ),
    );
  }
}
