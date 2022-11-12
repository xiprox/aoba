import 'package:aoba/consts/consts.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

class QuickUpdateEntry extends StatelessWidget {
  static const kDesiredHeight = kDesiredWidth * AspectRatios.mediaCover;
  static const kDesiredWidth = 128.0;

  final String coverUrl;
  final ImageType type;

  const QuickUpdateEntry({
    super.key,
    required this.coverUrl,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDesiredHeight,
      width: kDesiredWidth,
      child: Stack(
        children: [
          NetworkImageWithPlaceholder(type: type, url: coverUrl),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
