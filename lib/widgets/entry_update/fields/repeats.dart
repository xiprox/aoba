import 'package:aoba/widgets/input/int_input_field/int_input_form_field.dart';
import 'package:flutter/material.dart';

class RepeatsField extends StatelessWidget {
  final int? initialValue;
  final ValueChanged<int>? onChange;

  const RepeatsField({
    super.key,
    this.initialValue,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return IntInputFormField(
      initialValue: initialValue,
      min: 0,
      onChange: onChange,
    );
  }
}
