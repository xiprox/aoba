import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';

import 'aliases.dart';

/// Extensions on alises for generated GraphQL types.

extension MediaTypeExtension on MediaType {
  ImageType? toImageType() {
    switch (this) {
      case MediaType.ANIME:
        return ImageType.anime;
      case MediaType.MANGA:
        return ImageType.book;
      case MediaType.$unknown:
        return null;
    }
  }
}
