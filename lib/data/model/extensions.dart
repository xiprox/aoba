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

extension MediaListSortExts on MediaListSort {
  String get displayName {
    switch (this) {
      case MediaListSort.ADDED_TIME:
        return 'Last Added';
      case MediaListSort.ADDED_TIME_DESC:
        return 'Last Added (Desc)';
      case MediaListSort.FINISHED_ON:
        return 'Finished On';
      case MediaListSort.FINISHED_ON_DESC:
        return 'Finished On (Desc)';
      case MediaListSort.MEDIA_ID:
        return 'Media ID';
      case MediaListSort.MEDIA_ID_DESC:
        return 'Media ID (Desc)';
      case MediaListSort.MEDIA_POPULARITY:
        return 'Popularity';
      case MediaListSort.MEDIA_POPULARITY_DESC:
        return 'Populairty (Desc)';
      case MediaListSort.MEDIA_TITLE_ENGLISH:
        return 'Title';
      case MediaListSort.MEDIA_TITLE_ENGLISH_DESC:
        return 'Title (Desc)';
      case MediaListSort.MEDIA_TITLE_NATIVE:
        return 'Title';
      case MediaListSort.MEDIA_TITLE_NATIVE_DESC:
        return 'Title (Desc)';
      case MediaListSort.MEDIA_TITLE_ROMAJI:
        return 'Title';
      case MediaListSort.MEDIA_TITLE_ROMAJI_DESC:
        return 'Title (Desc)';
      case MediaListSort.PRIORITY:
        return 'Priority';
      case MediaListSort.PRIORITY_DESC:
        return 'Priority (Desc)';
      case MediaListSort.PROGRESS:
        return 'Progress';
      case MediaListSort.PROGRESS_DESC:
        return 'Progress (Desc)';
      case MediaListSort.PROGRESS_VOLUMES:
        return 'Progress (Volumes)';
      case MediaListSort.PROGRESS_VOLUMES_DESC:
        return 'Progress (Volumes, Desc)';
      case MediaListSort.REPEAT:
        return 'Repeat';
      case MediaListSort.REPEAT_DESC:
        return 'Repeat (Desc)';
      case MediaListSort.SCORE:
        return 'Score';
      case MediaListSort.SCORE_DESC:
        return 'Score (Desc)';
      case MediaListSort.STARTED_ON:
        return 'Started On';
      case MediaListSort.STARTED_ON_DESC:
        return 'Started On (Desc)';
      case MediaListSort.STATUS:
        return 'Status';
      case MediaListSort.STATUS_DESC:
        return 'Status (Desc)';
      case MediaListSort.UPDATED_TIME:
        return 'Last Updated';
      case MediaListSort.UPDATED_TIME_DESC:
        return 'Last Updated (Desc)';
      case MediaListSort.$unknown:
        return 'Unknown';
    }
  }

  bool get desc => name.contains('_DESC');

  MediaListSort withoutOrder() {
    switch (this) {
      case MediaListSort.ADDED_TIME:
      case MediaListSort.ADDED_TIME_DESC:
        return MediaListSort.ADDED_TIME;
      case MediaListSort.FINISHED_ON:
      case MediaListSort.FINISHED_ON_DESC:
        return MediaListSort.FINISHED_ON;
      case MediaListSort.MEDIA_ID:
      case MediaListSort.MEDIA_ID_DESC:
        return MediaListSort.MEDIA_ID;
      case MediaListSort.MEDIA_POPULARITY:
      case MediaListSort.MEDIA_POPULARITY_DESC:
        return MediaListSort.MEDIA_POPULARITY;
      case MediaListSort.MEDIA_TITLE_ENGLISH:
      case MediaListSort.MEDIA_TITLE_ENGLISH_DESC:
        return MediaListSort.MEDIA_TITLE_ENGLISH;
      case MediaListSort.MEDIA_TITLE_NATIVE:
      case MediaListSort.MEDIA_TITLE_NATIVE_DESC:
        return MediaListSort.MEDIA_TITLE_NATIVE;
      case MediaListSort.MEDIA_TITLE_ROMAJI:
      case MediaListSort.MEDIA_TITLE_ROMAJI_DESC:
        return MediaListSort.MEDIA_TITLE_ROMAJI;
      case MediaListSort.PRIORITY:
      case MediaListSort.PRIORITY_DESC:
        return MediaListSort.PRIORITY;
      case MediaListSort.PROGRESS:
      case MediaListSort.PROGRESS_DESC:
        return MediaListSort.PROGRESS;
      case MediaListSort.PROGRESS_VOLUMES:
      case MediaListSort.PROGRESS_VOLUMES_DESC:
        return MediaListSort.PROGRESS_VOLUMES;
      case MediaListSort.REPEAT:
      case MediaListSort.REPEAT_DESC:
        return MediaListSort.REPEAT;
      case MediaListSort.SCORE:
      case MediaListSort.SCORE_DESC:
        return MediaListSort.SCORE;
      case MediaListSort.STARTED_ON:
      case MediaListSort.STARTED_ON_DESC:
        return MediaListSort.STARTED_ON;
      case MediaListSort.STATUS:
      case MediaListSort.STATUS_DESC:
        return MediaListSort.STATUS;
      case MediaListSort.UPDATED_TIME:
      case MediaListSort.UPDATED_TIME_DESC:
        return MediaListSort.UPDATED_TIME;
      case MediaListSort.$unknown:
        return this;
    }
  }

  MediaListSort withOrder({required bool descending}) {
    switch (this) {
      case MediaListSort.ADDED_TIME:
      case MediaListSort.ADDED_TIME_DESC:
        return descending
            ? MediaListSort.ADDED_TIME_DESC
            : MediaListSort.ADDED_TIME;
      case MediaListSort.FINISHED_ON:
      case MediaListSort.FINISHED_ON_DESC:
        return descending
            ? MediaListSort.FINISHED_ON_DESC
            : MediaListSort.FINISHED_ON;
      case MediaListSort.MEDIA_ID:
      case MediaListSort.MEDIA_ID_DESC:
        return descending
            ? MediaListSort.MEDIA_ID_DESC
            : MediaListSort.MEDIA_ID;
      case MediaListSort.MEDIA_POPULARITY:
      case MediaListSort.MEDIA_POPULARITY_DESC:
        return descending
            ? MediaListSort.MEDIA_POPULARITY_DESC
            : MediaListSort.MEDIA_POPULARITY;
      case MediaListSort.MEDIA_TITLE_ENGLISH:
      case MediaListSort.MEDIA_TITLE_ENGLISH_DESC:
        return descending
            ? MediaListSort.MEDIA_TITLE_ENGLISH_DESC
            : MediaListSort.MEDIA_TITLE_ENGLISH;
      case MediaListSort.MEDIA_TITLE_NATIVE:
      case MediaListSort.MEDIA_TITLE_NATIVE_DESC:
        return descending
            ? MediaListSort.MEDIA_TITLE_NATIVE_DESC
            : MediaListSort.MEDIA_TITLE_NATIVE;
      case MediaListSort.MEDIA_TITLE_ROMAJI:
      case MediaListSort.MEDIA_TITLE_ROMAJI_DESC:
        return descending
            ? MediaListSort.MEDIA_TITLE_ROMAJI_DESC
            : MediaListSort.MEDIA_TITLE_ROMAJI;
      case MediaListSort.PRIORITY:
      case MediaListSort.PRIORITY_DESC:
        return descending
            ? MediaListSort.PRIORITY_DESC
            : MediaListSort.PRIORITY;
      case MediaListSort.PROGRESS:
      case MediaListSort.PROGRESS_DESC:
        return descending
            ? MediaListSort.PROGRESS_DESC
            : MediaListSort.PROGRESS;
      case MediaListSort.PROGRESS_VOLUMES:
      case MediaListSort.PROGRESS_VOLUMES_DESC:
        return descending
            ? MediaListSort.PROGRESS_VOLUMES_DESC
            : MediaListSort.PROGRESS_VOLUMES;
      case MediaListSort.REPEAT:
      case MediaListSort.REPEAT_DESC:
        return descending ? MediaListSort.REPEAT_DESC : MediaListSort.REPEAT;
      case MediaListSort.SCORE:
      case MediaListSort.SCORE_DESC:
        return descending ? MediaListSort.SCORE_DESC : MediaListSort.SCORE;
      case MediaListSort.STARTED_ON:
      case MediaListSort.STARTED_ON_DESC:
        return descending
            ? MediaListSort.STARTED_ON_DESC
            : MediaListSort.STARTED_ON;
      case MediaListSort.STATUS:
      case MediaListSort.STATUS_DESC:
        return descending ? MediaListSort.STATUS_DESC : MediaListSort.STATUS;
      case MediaListSort.UPDATED_TIME:
      case MediaListSort.UPDATED_TIME_DESC:
        return descending
            ? MediaListSort.UPDATED_TIME_DESC
            : MediaListSort.UPDATED_TIME;
      case MediaListSort.$unknown:
        return this;
    }
  }
}
