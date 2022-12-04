import 'package:aoba/consts/aspect_ratios.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

class MediaCover extends StatelessWidget {
  final String? url;
  final MediaType? type;
  final Color? color;

  const MediaCover({
    super.key,
    this.url,
    this.type,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return NetworkImageWithPlaceholder(
      key: ValueKey(url),
      url: url,
      type: type == MediaType.ANIME ? ImageType.anime : ImageType.book,
      width: 48,
      height: 48 * AspectRatios.mediaCover,
      color: color,
    );
  }
}
