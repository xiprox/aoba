import 'package:flutter/material.dart';

class SliderScoreInput extends StatelessWidget {
  final double min;
  final double max;
  final double increment;
  final double value;
  final ValueChanged<double> onChanged;

  const SliderScoreInput({
    super.key,
    required this.min,
    required this.max,
    required this.increment,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: min,
      max: max,
      divisions: max ~/ increment,
      value: value,
      onChanged: onChanged,
    );
  }
}
