import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/double_exts.dart';
import 'package:aoba/widgets/input/decoration_wrapper/input_decoration_wrapper.dart';
import 'package:aoba/widgets/input/score_input_field/score_input_form_field.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class ScoreField extends StatefulWidget {
  final ScoreFormat scoreFormat;
  final double? initialValue;
  final ValueChanged<double>? onChange;

  const ScoreField({
    super.key,
    required this.scoreFormat,
    this.initialValue,
    this.onChange,
  });

  @override
  State<ScoreField> createState() => _ScoreFieldState();
}

class _ScoreFieldState extends State<ScoreField> {
  late double? score = widget.initialValue;

  void _onChange(double value) {
    setState(() => score = value);
    widget.onChange?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final color = theme.textTheme.bodySmall?.color;

    final scoreText = score == null || score == 0
        ? 'None'
        : score!.toHumanReadableScore(widget.scoreFormat);
    final scoreColor =
        score == null || score == 0 ? color?.withOpacity(0.5) : color;

    double valueWidth;
    switch (widget.scoreFormat) {
      case ScoreFormat.POINT_100:
      case ScoreFormat.POINT_10_DECIMAL:
      case ScoreFormat.POINT_10:
      case ScoreFormat.POINT_3:
        valueWidth = 48;
        break;
      case ScoreFormat.POINT_5:
        valueWidth = 88;
        break;
      case ScoreFormat.$unknown:
        valueWidth = 0;
        break;
    }

    return Row(
      children: [
        InputDecorationWrapper(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: AnimatedContainer(
            width: valueWidth,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  color: scoreColor,
                ),
                child: Text(
                  scoreText,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ScoreInputFormField(
            format: widget.scoreFormat,
            initialValue: widget.initialValue,
            onChange: _onChange,
          ),
        ),
      ],
    );
  }
}
