import 'package:aoba/features/lists/lists_vm.dart';
import 'package:aoba/widgets/popup_on_position/popup_on_position_container.dart';
import 'package:flutter/material.dart';

import 'display_type_option.dart';

class ListsOptionsPopupContent extends StatelessWidget {
  static const kWidth = 240.0;

  final ListsViewModel vm;

  const ListsOptionsPopupContent({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm,
      builder: (context, child) {
        return SizedBox(
          width: kWidth,
          child: PopupOnPositionContainer(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DisplayTypeOption(
                    value: vm.optionDisplayType,
                    onChange: vm.onOptionDisplayTypeChange,
                  ),
                  const SizedBox(height: 16),
                  Material(
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        'More options, such as sorting and filtering, soon™',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
