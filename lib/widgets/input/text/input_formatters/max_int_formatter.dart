import 'package:flutter/services.dart';

class TextInputMaxIntFormatter extends TextInputFormatter {
  final int max;

  TextInputMaxIntFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? value = int.tryParse(newValue.text);
    if (value == null || value > max) {
      return oldValue;
    }

    return newValue;
  }
}
