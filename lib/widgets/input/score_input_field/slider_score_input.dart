import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliderScoreInput extends StatelessWidget {
  final double min;
  final double max;
  final double increment;
  final double value;
  final ValueChanged<double> onChange;

  const SliderScoreInput({
    super.key,
    required this.min,
    required this.max,
    required this.increment,
    required this.value,
    required this.onChange,
  });

  void _onChange(double value) {
    if (value == min || value == max) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.selectionClick();
    }
    onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      divisions: max ~/ increment,
      value: value,
      onChanged: _onChange,
    );
  }
}
