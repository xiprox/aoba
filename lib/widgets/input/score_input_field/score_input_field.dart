import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/input/score_input_field/slider_score_input.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class ScoreInputField extends StatelessWidget {
  final ScoreFormat format;
  final double value;
  final ValueChanged<double> onChanged;

  const ScoreInputField({
    super.key,
    required this.format,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget picker;
    switch (format) {
      case ScoreFormat.POINT_100:
        picker = SliderScoreInput(
          min: 0,
          max: 100,
          increment: 1,
          value: value,
          onChanged: onChanged,
        );
        break;
      case ScoreFormat.POINT_10:
        picker = SliderScoreInput(
          min: 0,
          max: 10,
          increment: 1,
          value: value,
          onChanged: onChanged,
        );
        break;
      case ScoreFormat.POINT_10_DECIMAL:
        picker = SliderScoreInput(
          min: 0,
          max: 10,
          increment: 0.5,
          value: value,
          onChanged: onChanged,
        );
        break;
      case ScoreFormat.POINT_5:
        picker = SliderScoreInput(
          min: 0,
          max: 5,
          increment: 1,
          value: value,
          onChanged: onChanged,
        );
        break;
      case ScoreFormat.POINT_3:
        picker = SliderScoreInput(
          min: 0,
          max: 3,
          increment: 1,
          value: value,
          onChanged: onChanged,
        );
        break;
      default:
        picker = Container();
        break;
    }

    final theme = context.theme;
    return Theme(
      data: theme.copyWith(
        sliderTheme: theme.sliderTheme.copyWith(
          showValueIndicator: ShowValueIndicator.always,
          thumbShape: const RoundSliderThumbShape(
            elevation: 0,
            pressedElevation: 0,
          ),
          overlayColor: Colors.transparent,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
        ),
      ),
      child: picker,
    );
  }
}
