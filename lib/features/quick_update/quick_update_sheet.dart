import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/features/quick_update/quick_update_vm.dart';
import 'package:aoba/widgets/expandable_sheet/expandable_sheet.dart';
import 'package:aoba/widgets/resource_builder/resource_builder.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'content.dart';
import 'loading_state.dart';
import 'entry/quick_update_entry.dart';
import 'error_state.dart';
import 'header.dart';

class QuickUpdateSheet extends ViewModelWidget<QuickUpdateViewModel> {
  const QuickUpdateSheet({Key? key}) : super(key: key);

  static const kCollapsedHeight = 80.0;

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    QuickUpdateViewModel vm,
  ) {
    super.handleOrder(context, order, vm);
  }

  @override
  Widget build(BuildContext context, QuickUpdateViewModel vm) {
    final colors = context.colors;

    const entryHeight = QuickUpdateEntry.kDesiredHeight;
    const contentHeight = entryHeight;

    return ExpandableSheet(
      minHeight: kCollapsedHeight,
      maxHeight: contentHeight - 4,
      color: colors.surfaceTone3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(onRefreshPress: vm.onRefreshPress),
          SizedBox(
            height: contentHeight,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 0),
              switchInCurve: Curves.fastOutSlowIn,
              switchOutCurve: Curves.fastOutSlowIn.flipped,
              child: ResourceBuilder(
                // TODO: fix
                key: ValueKey(vm.entries.status),
                resource: vm.entries,
                emptyBuilder: (_) => const LoadingState(),
                loadingBuilder: (_, data) {
                  return data == null ? const LoadingState() : const Content();
                },
                errorBuilder: (_, error, __) => ErrorState(error: error),
                contentBuilder: (_, __) => const Content(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
