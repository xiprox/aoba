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
        return 'Not Yet Released';
      case MediaStatus.CANCELLED:
        return 'Cancelled';
      case MediaStatus.HIATUS:
        return 'On Hiatus';
      case MediaStatus.$unknown:
        return 'Unknown';
    }
  }
}

extension MediaListStatusExts on MediaListStatus {
  String get displayName {
    switch (this) {
      case MediaListStatus.COMPLETED:
        return 'Completed';
      case MediaListStatus.CURRENT:
        return 'Current';
      case MediaListStatus.PLANNING:
        return 'Planning';
      case MediaListStatus.DROPPED:
        return 'Dropped';
      case MediaListStatus.PAUSED:
        return 'Paused';
      case MediaListStatus.REPEATING:
        return 'Repeating';
      case MediaListStatus.$unknown:
        return 'Unknown';
    }
  }

  String get displayNameForAnime {
    switch (this) {
      case MediaListStatus.CURRENT:
        return 'Watching';
      case MediaListStatus.REPEATING:
        return 'Re-watching';
      default:
        return displayName;
    }
  }

  String get displayNameForManga {
    switch (this) {
      case MediaListStatus.CURRENT:
        return 'Reading';
      case MediaListStatus.REPEATING:
        return 'Re-reading';
      default:
        return displayName;
    }
  }
}
