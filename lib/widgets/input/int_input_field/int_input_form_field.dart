import 'package:aoba/widgets/input/text/input_formatters/max_int_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntInputFormField extends StatelessWidget {
  final int? initialValue;
  final int? max;

  const IntInputFormField({
    super.key,
    this.initialValue = 0,
    this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: initialValue?.toString() ?? '0',
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              suffix: max == null ? null : Text(' / $max'),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              if (max != null) TextInputMaxIntFormatter(max!),
            ],
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_rounded),
        ),
      ],
    );
  }
}
