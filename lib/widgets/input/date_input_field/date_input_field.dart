import 'package:aoba/exts/theme_data_exts.dart';
import 'package:aoba/widgets/input/decoration_wrapper/input_decoration_wrapper.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final _kFormatter = DateFormat('yyyy-MM-dd');

class DateInputField extends StatelessWidget {
  final DateTime? value;
  final DateTime? min;
  final DateTime? max;
  final String? Function(DateTime? value)? labelGetter;
  final ValueChanged<DateTime?> onChange;
  final String hint;
  final bool expanded;
  final bool allowDelete;

  const DateInputField({
    super.key,
    this.value,
    this.min,
    this.max,
    required this.onChange,
    this.labelGetter,
    this.hint = 'Pick a date',
    this.expanded = false,
    this.allowDelete = true,
  });

  void _onPress(BuildContext context) async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: value ?? now,
      firstDate: min ?? DateTime(now.year - 100, 1, 1),
      lastDate: max ?? DateTime(2031, 1, 0),
    );
    if (result != null) onChange(result);
  }

  void _onDeletePress() {
    HapticFeedback.lightImpact();
    onChange(null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final borderRadius = theme.inputDecorationTheme.borderRadius;

    final label = labelGetter?.call(value) ?? value?.format(_kFormatter);

    final deleteAvailable = allowDelete && value != null;

    return InputDecorationWrapper(
      onPress: () => _onPress(context),
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Flexible(
            fit: expanded ? FlexFit.tight : FlexFit.loose,
            child: Text(
              label ?? hint,
              style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodySmall?.color
                    ?.withOpacity(label == null ? 0.5 : 1),
              ),
            ),
          ),
          InkWell(
            onTap: deleteAvailable ? _onDeletePress : null,
            borderRadius: BorderRadius.only(
              topRight: borderRadius?.topRight ?? Radius.zero,
              bottomRight: borderRadius?.bottomRight ?? Radius.zero,
            ),
            child: AnimatedOpacity(
              opacity: deleteAvailable ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: const Padding(
                padding: EdgeInsetsDirectional.all(12),
                child: Opacity(
                  opacity: 0.6,
                  child: Icon(Icons.close_rounded),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
