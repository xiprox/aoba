import 'package:aoba/exts/build_context_exts.dart';
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

    Duration refreshPeriod = const Duration(days: 1000);
    if (fromNow.inMinutes < 1) {
      refreshPeriod = const Duration(seconds: 1);
    } else if (fromNow.inHours < 1) {
      refreshPeriod = const Duration(minutes: 1);
    } else if (fromNow.inDays < 1) {
      refreshPeriod = const Duration(minutes: 20);
    }

    return TimerBuilder.periodic(
      refreshPeriod,
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
