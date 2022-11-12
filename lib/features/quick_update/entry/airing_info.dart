import 'package:aoba/widgets/duration/custom_duration_locale.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

import 'info_box.dart';

class AiringInfo extends StatelessWidget {
  final ColorScheme colorScheme;
  final int? airingAt;
  final int? timeUntilAiring;
  final int? episode;

  const AiringInfo({
    super.key,
    required this.colorScheme,
    this.airingAt,
    this.timeUntilAiring,
    this.episode,
  });

  @override
  Widget build(BuildContext context) {
    final until = Duration(seconds: timeUntilAiring ?? 0);
    return InfoBox(
      color: colorScheme.secondaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ep ${episode ?? '?'}',
                style: TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                prettyDuration(
                  until,
                  abbreviated: true,
                  tersity: DurationTersity.minute,
                  locale: const CustomDurationLocale(),
                ),
                style: TextStyle(
                  color: colorScheme.onSecondaryContainer.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
