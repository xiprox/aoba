import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';

import 'aliases.dart';

/// Extensions on alises for generated GraphQL types.

extension MediaTypeExts on MediaType {
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

  String get displayName {
    switch (this) {
      case MediaType.ANIME:
        return 'Anime';
      case MediaType.MANGA:
        return 'Manga';
      case MediaType.$unknown:
        return 'Unknown';
    }
  }
}

extension MediaFormatExts on MediaFormat {
  String get displayName {
    switch (this) {
      case MediaFormat.TV:
        return 'TV';
      case MediaFormat.TV_SHORT:
        return 'TV Short';
      case MediaFormat.MOVIE:
        return 'Movie';
      case MediaFormat.SPECIAL:
        return 'Special';
      case MediaFormat.OVA:
        return 'OVA';
      case MediaFormat.ONA:
        return 'ONA';
      case MediaFormat.MUSIC:
        return 'Music';
      case MediaFormat.MANGA:
        return 'Manga';
      case MediaFormat.NOVEL:
        return 'Novel';
      case MediaFormat.ONE_SHOT:
        return 'One-shot';
      case MediaFormat.$unknown:
        return 'Unknown';
    }
  }
}

extension MediaStatusExts on MediaStatus {
  String get displayName {
    switch (this) {
      case MediaStatus.FINISHED:
        return 'Finished';
      case MediaStatus.RELEASING:
        return 'Releasing';
      case MediaStatus.NOT_YET_RELEASED:
        return 'Not yet released';
      case MediaStatus.CANCELLED:
        return 'Cancelled';
      case MediaStatus.HIATUS:
        return 'On Hiatus';
      case MediaStatus.$unknown:
        return 'Unknown';
    }
  }
}
