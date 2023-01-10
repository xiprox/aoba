import 'package:aoba/widgets/input/int_input_field/int_input_form_field.dart';
import 'package:flutter/material.dart';

class RepeatsField extends StatelessWidget {
  final int? initialValue;

  const RepeatsField({
    super.key,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return IntInputFormField(
      initialValue: initialValue,
    );
  }
}
