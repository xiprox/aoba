import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/input/score_input_field/score_input_field.dart';
import 'package:flutter/material.dart';

class ScoreInputFormField extends StatelessWidget {
  final ScoreFormat format;
  final double? initialValue;
  final ValueChanged<double>? onChanged;

  const ScoreInputFormField({
    super.key,
    required this.format,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<double>(
      initialValue: initialValue,
      builder: (state) {
        return ScoreInputField(
          format: format,
          value: state.value ?? 0,
          onChanged: (value) {
            state.didChange(value);
            onChanged?.call(value);
          },
        );
      },
    );
  }
}
