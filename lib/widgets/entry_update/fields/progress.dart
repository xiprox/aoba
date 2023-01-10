import 'package:aoba/widgets/input/int_input_field/int_input_form_field.dart';
import 'package:flutter/material.dart';

class ProgressField extends StatelessWidget {
  final int? initialValue;
  final int? max;

  const ProgressField({
    super.key,
    this.initialValue,
    this.max,
  });

  @override
  Widget build(BuildContext context) {
    return IntInputFormField(
      initialValue: initialValue,
      min: 0,
      max: max,
    );
  }
}
