import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/double_exts.dart';
import 'package:aoba/widgets/input/score_input_field/score_input_form_field.dart';
import 'package:flutter/material.dart';

class ScoreField extends StatefulWidget {
  final ScoreFormat scoreFormat;
  final double? initialValue;

  const ScoreField({
    super.key,
    required this.scoreFormat,
    this.initialValue,
  });

  @override
  State<ScoreField> createState() => _ScoreFieldState();
}

class _ScoreFieldState extends State<ScoreField> {
  late double? score = widget.initialValue;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final scoreText = score == null || score == 0
        ? 'None'
        : score!.toHumanReadableScore(widget.scoreFormat);
    final scoreColor = score == null || score == 0
        ? colors.onSurface.withOpacity(0.5)
        : colors.onSurface;

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
        Expanded(
          child: ScoreInputFormField(
            format: widget.scoreFormat,
            initialValue: widget.initialValue,
            onChange: (value) => setState(() => score = value),
          ),
        ),
        AnimatedContainer(
          width: valueWidth,
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
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
      ],
    );
  }
}
