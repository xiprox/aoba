import 'package:aoba/data/model/aliases.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'info_box.dart';

class ProgressInfo extends StatelessWidget {
  final ColorScheme colorScheme;
  final int? progress;
  final MediaType mediaType;
  final Function()? onIncrementPress;

  const ProgressInfo({
    super.key,
    required this.colorScheme,
    this.progress,
    required this.mediaType,
    this.onIncrementPress,
  });

  @override
  Widget build(BuildContext context) {
    final inkColor = colorScheme.primary.withOpacity(0.2);
    final hoverColor = colorScheme.primary.withOpacity(0.1);

    return InfoBox(
      color: colorScheme.secondaryContainer,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                'On ${mediaType == MediaType.ANIME ? 'ep' : 'ch'} '
                '${progress ?? '?'}',
                style: TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: InkResponse(
              onTap: onIncrementPress == null
                  ? null
                  : () {
                      onIncrementPress?.call();
                      HapticFeedback.lightImpact();
                    },
              containedInkWell: false,
              focusColor: inkColor,
              splashColor: inkColor,
              hoverColor: hoverColor,
              highlightColor: inkColor,
              radius: 100,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: Text(
                    '+1',
                    style: TextStyle(
                      fontSize: 18,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
