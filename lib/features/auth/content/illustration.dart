import 'dart:math';

import 'package:aoba/data/assets/assets.gen.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundIllustration extends StatelessWidget {
  const BackgroundIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.media.size.width;
    final colors = context.colors;
    return Center(
      child: Transform.scale(
        scale: 1.8,
        child: Transform.translate(
          offset: const Offset(24, 0),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.skew(0.2, -0.0)..rotateZ(350 * pi / 180),
            child: SvgPicture.asset(
              Assets.images.clover.path,
              color: colors.secondary.withOpacity(0.01),
              width: width * 1,
            ),
          ),
        ),
      ),
    );
  }
}
