import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/duration_exts.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class Timestamp extends StatelessWidget {
  final int timestamp;

  const Timestamp({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.fromMicrosecondsSinceEpoch(timestamp);

    final fromNow = DateTime.now().difference(date).abs();

    return TimerBuilder.periodic(
      fromNow.refreshPeriod(),
      builder: (context) {
        return Text(
          date.relative(
            appendIfAfter: 'ago',
            prependIfBefore: 'in',
          ),
          style: TextStyle(
            color: context.colors.onSurface.withOpacity(0.4),
          ),
        );
      },
    );
  }
}
