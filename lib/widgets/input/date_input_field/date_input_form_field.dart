import 'package:aoba/widgets/input/date_input_field/date_input_field.dart';
import 'package:flutter/material.dart';

class DateInputFormField extends StatelessWidget {
  final DateTime? initialValue;
  final DateTime? min;
  final DateTime? max;
  final String? Function(DateTime? value)? labelGetter;
  final ValueChanged<DateTime?>? onChange;
  final String? hint;
  final bool? expanded;
  final bool? allowDelete;

  const DateInputFormField({
    super.key,
    this.initialValue,
    this.min,
    this.max,
    this.onChange,
    this.labelGetter,
    this.hint,
    this.expanded,
    this.allowDelete,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime?>(
      initialValue: initialValue,
      builder: (state) {
        return DateInputField(
          value: state.value,
          min: min,
          max: max,
          labelGetter: labelGetter,
          expanded: expanded ?? false,
          hint: hint ?? 'Pick a date',
          allowDelete: allowDelete ?? true,
          onChange: (value) {
            state.didChange(value);
            onChange?.call(value);
          },
        );
      },
    );
  }
}
