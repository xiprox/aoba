import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/input/text/input_formatters/max_int_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntInputFormField extends StatefulWidget {
  final int? initialValue;
  final int? min;
  final int? max;

  const IntInputFormField({
    super.key,
    this.initialValue = 0,
    this.min,
    this.max,
  })  : assert(initialValue == null || (min == null || initialValue >= min)),
        assert(initialValue == null || (max == null || initialValue <= max));

  @override
  State<IntInputFormField> createState() => _IntInputFormFieldState();
}

class _IntInputFormFieldState extends State<IntInputFormField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialValue?.toString(),
  );

  @override
  void didUpdateWidget(covariant IntInputFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue?.toString() ?? '';
    }
  }

  int? _parseValue(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return int.tryParse(value);
  }

  void _setValue(int value) {
    setState(() {
      if (widget.min != null && value < widget.min!) {
        return;
      } else if (widget.max != null && value > widget.max!) {
        return;
      } else {
        if (value == widget.min || value == widget.max) {
          HapticFeedback.lightImpact();
        } else {
          HapticFeedback.selectionClick();
        }
        _controller.text = value.toString();
      }
    });
  }

  void _onDecrementPress() {
    final value = _parseValue(_controller.text);
    if (value != null) {
      _setValue(value - 1);
    }
  }

  void _onIncrementPress() {
    final value = _parseValue(_controller.text);
    if (value != null) {
      _setValue(value + 1);
    }
  }

  bool get decrementEnabled {
    final value = _parseValue(_controller.text);
    return value == null || (widget.min == null || value > widget.min!);
  }

  bool get incrementEnabled {
    final value = _parseValue(_controller.text);
    return value == null || (widget.max == null || value < widget.max!);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              suffix: widget.max == null ? null : Text(' / ${widget.max}'),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              if (widget.max != null) TextInputMaxIntFormatter(widget.max!),
            ],
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: decrementEnabled ? _onDecrementPress : null,
          color: colors.primary,
          disabledColor: colors.primary.withOpacity(0.4),
          icon: const Icon(Icons.remove_rounded),
        ),
        IconButton(
          onPressed: incrementEnabled ? _onIncrementPress : null,
          color: colors.primary,
          disabledColor: colors.primary.withOpacity(0.4),
          icon: const Icon(Icons.add_circle_outline_rounded),
        ),
      ],
    );
  }
}
