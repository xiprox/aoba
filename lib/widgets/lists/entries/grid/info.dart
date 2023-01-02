import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/lists/entries/common/title.dart';
import 'package:aoba/widgets/wave_border/wave_border.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart' hide Title;

class Info extends StatelessWidget {
  static const kWaveHeight = 4.0;
  static const kTotalHeight = 56.0;

  final Radius radius;
  final String title;
  final Widget subtitle;

  final Function()? onPress;

  const Info({
    super.key,
    required this.title,
    required this.radius,
    required this.subtitle,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;

    final shape = WaveBorder(
      borderRadius: BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      side: const WaveSide.only(
        top: Wave(amplitude: kWaveHeight, wavelength: 20),
      ),
    );

    return SizedBox(
      height: kTotalHeight,
      child: Material(
        color: colors.secondaryContainer,
        shape: shape,
        child: InkWell(
          onTap: onPress,
          customBorder: shape,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10,
              end: 10,
              top: 8,
              bottom: 8,
            ),
            child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                Row(children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Title(
                          title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: colors.onSecondaryContainer,
                          ),
                        ),
                        subtitle,
                      ],
                    ),
                  ),
                ]),
                if (onPress != null)
                  Icon(
                    Icons.edit_rounded,
                    color: colors.secondary.withOpacity(0.05),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
