import 'package:aoba/consts/consts.dart';
import 'package:aoba/data/remote/gql/schema/schema.graphql.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

class MediaCover extends StatelessWidget {
  final String? url;
  final Enum$MediaType? type;

  const MediaCover({
    super.key,
    this.url,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return NetworkImageWithPlaceholder(
      key: ValueKey(url),
      url: url,
      type: type == Enum$MediaType.ANIME ? ImageType.anime : ImageType.book,
      width: 48,
      height: 48 * AspectRatios.mediaCover,
    );
  }
}
