import 'package:aoba/exts/build_context_exts.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class Timestamp extends StatelessWidget {
  final int timestamp;

  const Timestamp({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    return Text(
      date.relative(
        appendIfAfter: 'ago',
        prependIfBefore: 'in',
      ),
      style: TextStyle(
        color: context.colors.onSurfaceVariant.withOpacity(0.5),
      ),
    );
  }
}
