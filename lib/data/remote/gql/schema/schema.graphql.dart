import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$AiringScheduleInput {
  Input$AiringScheduleInput(
      {this.airingAt, this.episode, this.timeUntilAiring});

  @override
  factory Input$AiringScheduleInput.fromJson(Map<String, dynamic> json) =>
      _$Input$AiringScheduleInputFromJson(json);

  final int? airingAt;

  final int? episode;

  final int? timeUntilAiring;

  Map<String, dynamic> toJson() => _$Input$AiringScheduleInputToJson(this);
  int get hashCode {
    final l$airingAt = airingAt;
    final l$episode = episode;
    final l$timeUntilAiring = timeUntilAiring;
    return Object.hashAll([l$airingAt, l$episode, l$timeUntilAiring]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$AiringScheduleInput) ||
        runtimeType != other.runtimeType) return false;
    final l$airingAt = airingAt;
    final lOther$airingAt = other.airingAt;
    if (l$airingAt != lOther$airingAt) return false;
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (l$episode != lOther$episode) return false;
    final l$timeUntilAiring = timeUntilAiring;
    final lOther$timeUntilAiring = other.timeUntilAiring;
    if (l$timeUntilAiring != lOther$timeUntilAiring) return false;
    return true;
  }

  Input$AiringScheduleInput copyWith(
          {int? Function()? airingAt,
          int? Function()? episode,
          int? Function()? timeUntilAiring}) =>
      Input$AiringScheduleInput(
          airingAt: airingAt == null ? this.airingAt : airingAt(),
          episode: episode == null ? this.episode : episode(),
          timeUntilAiring: timeUntilAiring == null
              ? this.timeUntilAiring
              : timeUntilAiring());
}

@JsonSerializable(explicitToJson: true)
class Input$AniChartHighlightInput {
  Input$AniChartHighlightInput({this.mediaId, this.highlight});

  @override
  factory Input$AniChartHighlightInput.fromJson(Map<String, dynamic> json) =>
      _$Input$AniChartHighlightInputFromJson(json);

  final int? mediaId;

  final String? highlight;

  Map<String, dynamic> toJson() => _$Input$AniChartHighlightInputToJson(this);
  int get hashCode {
    final l$mediaId = mediaId;
    final l$highlight = highlight;
    return Object.hashAll([l$mediaId, l$highlight]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$AniChartHighlightInput) ||
        runtimeType != other.runtimeType) return false;
    final l$mediaId = mediaId;
    final lOther$mediaId = other.mediaId;
    if (l$mediaId != lOther$mediaId) return false;
    final l$highlight = highlight;
    final lOther$highlight = other.highlight;
    if (l$highlight != lOther$highlight) return false;
    return true;
  }

  Input$AniChartHighlightInput copyWith(
          {int? Function()? mediaId, String? Function()? highlight}) =>
      Input$AniChartHighlightInput(
          mediaId: mediaId == null ? this.mediaId : mediaId(),
          highlight: highlight == null ? this.highlight : highlight());
}

@JsonSerializable(explicitToJson: true)
class Input$CharacterNameInput {
  Input$CharacterNameInput(
      {this.first,
      this.middle,
      this.last,
      this.native,
      this.alternative,
      this.alternativeSpoiler});

  @override
  factory Input$CharacterNameInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CharacterNameInputFromJson(json);

  final String? first;

  final String? middle;

  final String? last;

  final String? native;

  final List<String?>? alternative;

  final List<String?>? alternativeSpoiler;

  Map<String, dynamic> toJson() => _$Input$CharacterNameInputToJson(this);
  int get hashCode {
    final l$first = first;
    final l$middle = middle;
    final l$last = last;
    final l$native = native;
    final l$alternative = alternative;
    final l$alternativeSpoiler = alternativeSpoiler;
    return Object.hashAll([
      l$first,
      l$middle,
      l$last,
      l$native,
      l$alternative == null
          ? null
          : Object.hashAll(l$alternative.map((v) => v)),
      l$alternativeSpoiler == null
          ? null
          : Object.hashAll(l$alternativeSpoiler.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CharacterNameInput) ||
        runtimeType != other.runtimeType) return false;
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) return false;
    final l$middle = middle;
    final lOther$middle = other.middle;
    if (l$middle != lOther$middle) return false;
    final l$last = last;
    final lOther$last = other.last;
    if (l$last != lOther$last) return false;
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) return false;
    final l$alternative = alternative;
    final lOther$alternative = other.alternative;
    if (l$alternative != null && lOther$alternative != null) {
      if (l$alternative.length != lOther$alternative.length) return false;
      for (int i = 0; i < l$alternative.length; i++) {
        final l$alternative$entry = l$alternative[i];
        final lOther$alternative$entry = lOther$alternative[i];
        if (l$alternative$entry != lOther$alternative$entry) return false;
      }
    } else if (l$alternative != lOther$alternative) {
      return false;
    }

    final l$alternativeSpoiler = alternativeSpoiler;
    final lOther$alternativeSpoiler = other.alternativeSpoiler;
    if (l$alternativeSpoiler != null && lOther$alternativeSpoiler != null) {
      if (l$alternativeSpoiler.length != lOther$alternativeSpoiler.length)
        return false;
      for (int i = 0; i < l$alternativeSpoiler.length; i++) {
        final l$alternativeSpoiler$entry = l$alternativeSpoiler[i];
        final lOther$alternativeSpoiler$entry = lOther$alternativeSpoiler[i];
        if (l$alternativeSpoiler$entry != lOther$alternativeSpoiler$entry)
          return false;
      }
    } else if (l$alternativeSpoiler != lOther$alternativeSpoiler) {
      return false;
    }

    return true;
  }

  Input$CharacterNameInput copyWith(
          {String? Function()? first,
          String? Function()? middle,
          String? Function()? last,
          String? Function()? native,
          List<String?>? Function()? alternative,
          List<String?>? Function()? alternativeSpoiler}) =>
      Input$CharacterNameInput(
          first: first == null ? this.first : first(),
          middle: middle == null ? this.middle : middle(),
          last: last == null ? this.last : last(),
          native: native == null ? this.native : native(),
          alternative: alternative == null ? this.alternative : alternative(),
          alternativeSpoiler: alternativeSpoiler == null
              ? this.alternativeSpoiler
              : alternativeSpoiler());
}

@JsonSerializable(explicitToJson: true)
class Input$FuzzyDateInput {
  Input$FuzzyDateInput({this.year, this.month, this.day});

  @override
  factory Input$FuzzyDateInput.fromJson(Map<String, dynamic> json) =>
      _$Input$FuzzyDateInputFromJson(json);

  final int? year;

  final int? month;

  final int? day;

  Map<String, dynamic> toJson() => _$Input$FuzzyDateInputToJson(this);
  int get hashCode {
    final l$year = year;
    final l$month = month;
    final l$day = day;
    return Object.hashAll([l$year, l$month, l$day]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$FuzzyDateInput) || runtimeType != other.runtimeType)
      return false;
    final l$year = year;
    final lOther$year = other.year;
    if (l$year != lOther$year) return false;
    final l$month = month;
    final lOther$month = other.month;
    if (l$month != lOther$month) return false;
    final l$day = day;
    final lOther$day = other.day;
    if (l$day != lOther$day) return false;
    return true;
  }

  Input$FuzzyDateInput copyWith(
          {int? Function()? year,
          int? Function()? month,
          int? Function()? day}) =>
      Input$FuzzyDateInput(
          year: year == null ? this.year : year(),
          month: month == null ? this.month : month(),
          day: day == null ? this.day : day());
}

@JsonSerializable(explicitToJson: true)
class Input$ListActivityOptionInput {
  Input$ListActivityOptionInput({this.disabled, this.type});

  @override
  factory Input$ListActivityOptionInput.fromJson(Map<String, dynamic> json) =>
      _$Input$ListActivityOptionInputFromJson(json);

  final bool? disabled;

  @JsonKey(unknownEnumValue: Enum$MediaListStatus.$unknown)
  final Enum$MediaListStatus? type;

  Map<String, dynamic> toJson() => _$Input$ListActivityOptionInputToJson(this);
  int get hashCode {
    final l$disabled = disabled;
    final l$type = type;
    return Object.hashAll([l$disabled, l$type]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$ListActivityOptionInput) ||
        runtimeType != other.runtimeType) return false;
    final l$disabled = disabled;
    final lOther$disabled = other.disabled;
    if (l$disabled != lOther$disabled) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    return true;
  }

  Input$ListActivityOptionInput copyWith(
          {bool? Function()? disabled,
          Enum$MediaListStatus? Function()? type}) =>
      Input$ListActivityOptionInput(
          disabled: disabled == null ? this.disabled : disabled(),
          type: type == null ? this.type : type());
}

@JsonSerializable(explicitToJson: true)
class Input$MediaExternalLinkInput {
  Input$MediaExternalLinkInput(
      {required this.id, required this.url, required this.site});

  @override
  factory Input$MediaExternalLinkInput.fromJson(Map<String, dynamic> json) =>
      _$Input$MediaExternalLinkInputFromJson(json);

  final int id;

  final String url;

  final String site;

  Map<String, dynamic> toJson() => _$Input$MediaExternalLinkInputToJson(this);
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$site = site;
    return Object.hashAll([l$id, l$url, l$site]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$MediaExternalLinkInput) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) return false;
    final l$site = site;
    final lOther$site = other.site;
    if (l$site != lOther$site) return false;
    return true;
  }

  Input$MediaExternalLinkInput copyWith({int? id, String? url, String? site}) =>
      Input$MediaExternalLinkInput(
          id: id == null ? this.id : id,
          url: url == null ? this.url : url,
          site: site == null ? this.site : site);
}

@JsonSerializable(explicitToJson: true)
class Input$MediaListOptionsInput {
  Input$MediaListOptionsInput(
      {this.sectionOrder,
      this.splitCompletedSectionByFormat,
      this.customLists,
      this.advancedScoring,
      this.advancedScoringEnabled,
      this.theme});

  @override
  factory Input$MediaListOptionsInput.fromJson(Map<String, dynamic> json) =>
      _$Input$MediaListOptionsInputFromJson(json);

  final List<String?>? sectionOrder;

  final bool? splitCompletedSectionByFormat;

  final List<String?>? customLists;

  final List<String?>? advancedScoring;

  final bool? advancedScoringEnabled;

  final String? theme;

  Map<String, dynamic> toJson() => _$Input$MediaListOptionsInputToJson(this);
  int get hashCode {
    final l$sectionOrder = sectionOrder;
    final l$splitCompletedSectionByFormat = splitCompletedSectionByFormat;
    final l$customLists = customLists;
    final l$advancedScoring = advancedScoring;
    final l$advancedScoringEnabled = advancedScoringEnabled;
    final l$theme = theme;
    return Object.hashAll([
      l$sectionOrder == null
          ? null
          : Object.hashAll(l$sectionOrder.map((v) => v)),
      l$splitCompletedSectionByFormat,
      l$customLists == null
          ? null
          : Object.hashAll(l$customLists.map((v) => v)),
      l$advancedScoring == null
          ? null
          : Object.hashAll(l$advancedScoring.map((v) => v)),
      l$advancedScoringEnabled,
      l$theme
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$MediaListOptionsInput) ||
        runtimeType != other.runtimeType) return false;
    final l$sectionOrder = sectionOrder;
    final lOther$sectionOrder = other.sectionOrder;
    if (l$sectionOrder != null && lOther$sectionOrder != null) {
      if (l$sectionOrder.length != lOther$sectionOrder.length) return false;
      for (int i = 0; i < l$sectionOrder.length; i++) {
        final l$sectionOrder$entry = l$sectionOrder[i];
        final lOther$sectionOrder$entry = lOther$sectionOrder[i];
        if (l$sectionOrder$entry != lOther$sectionOrder$entry) return false;
      }
    } else if (l$sectionOrder != lOther$sectionOrder) {
      return false;
    }

    final l$splitCompletedSectionByFormat = splitCompletedSectionByFormat;
    final lOther$splitCompletedSectionByFormat =
        other.splitCompletedSectionByFormat;
    if (l$splitCompletedSectionByFormat != lOther$splitCompletedSectionByFormat)
      return false;
    final l$customLists = customLists;
    final lOther$customLists = other.customLists;
    if (l$customLists != null && lOther$customLists != null) {
      if (l$customLists.length != lOther$customLists.length) return false;
      for (int i = 0; i < l$customLists.length; i++) {
        final l$customLists$entry = l$customLists[i];
        final lOther$customLists$entry = lOther$customLists[i];
        if (l$customLists$entry != lOther$customLists$entry) return false;
      }
    } else if (l$customLists != lOther$customLists) {
      return false;
    }

    final l$advancedScoring = advancedScoring;
    final lOther$advancedScoring = other.advancedScoring;
    if (l$advancedScoring != null && lOther$advancedScoring != null) {
      if (l$advancedScoring.length != lOther$advancedScoring.length)
        return false;
      for (int i = 0; i < l$advancedScoring.length; i++) {
        final l$advancedScoring$entry = l$advancedScoring[i];
        final lOther$advancedScoring$entry = lOther$advancedScoring[i];
        if (l$advancedScoring$entry != lOther$advancedScoring$entry)
          return false;
      }
    } else if (l$advancedScoring != lOther$advancedScoring) {
      return false;
    }

    final l$advancedScoringEnabled = advancedScoringEnabled;
    final lOther$advancedScoringEnabled = other.advancedScoringEnabled;
    if (l$advancedScoringEnabled != lOther$advancedScoringEnabled) return false;
    final l$theme = theme;
    final lOther$theme = other.theme;
    if (l$theme != lOther$theme) return false;
    return true;
  }

  Input$MediaListOptionsInput copyWith(
          {List<String?>? Function()? sectionOrder,
          bool? Function()? splitCompletedSectionByFormat,
          List<String?>? Function()? customLists,
          List<String?>? Function()? advancedScoring,
          bool? Function()? advancedScoringEnabled,
          String? Function()? theme}) =>
      Input$MediaListOptionsInput(
          sectionOrder:
              sectionOrder == null ? this.sectionOrder : sectionOrder(),
          splitCompletedSectionByFormat: splitCompletedSectionByFormat == null
              ? this.splitCompletedSectionByFormat
              : splitCompletedSectionByFormat(),
          customLists: customLists == null ? this.customLists : customLists(),
          advancedScoring: advancedScoring == null
              ? this.advancedScoring
              : advancedScoring(),
          advancedScoringEnabled: advancedScoringEnabled == null
              ? this.advancedScoringEnabled
              : advancedScoringEnabled(),
          theme: theme == null ? this.theme : theme());
}

@JsonSerializable(explicitToJson: true)
class Input$MediaTitleInput {
  Input$MediaTitleInput({this.romaji, this.english, this.native});

  @override
  factory Input$MediaTitleInput.fromJson(Map<String, dynamic> json) =>
      _$Input$MediaTitleInputFromJson(json);

  final String? romaji;

  final String? english;

  final String? native;

  Map<String, dynamic> toJson() => _$Input$MediaTitleInputToJson(this);
  int get hashCode {
    final l$romaji = romaji;
    final l$english = english;
    final l$native = native;
    return Object.hashAll([l$romaji, l$english, l$native]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$MediaTitleInput) || runtimeType != other.runtimeType)
      return false;
    final l$romaji = romaji;
    final lOther$romaji = other.romaji;
    if (l$romaji != lOther$romaji) return false;
    final l$english = english;
    final lOther$english = other.english;
    if (l$english != lOther$english) return false;
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) return false;
    return true;
  }

  Input$MediaTitleInput copyWith(
          {String? Function()? romaji,
          String? Function()? english,
          String? Function()? native}) =>
      Input$MediaTitleInput(
          romaji: romaji == null ? this.romaji : romaji(),
          english: english == null ? this.english : english(),
          native: native == null ? this.native : native());
}

@JsonSerializable(explicitToJson: true)
class Input$NotificationOptionInput {
  Input$NotificationOptionInput({this.type, this.enabled});

  @override
  factory Input$NotificationOptionInput.fromJson(Map<String, dynamic> json) =>
      _$Input$NotificationOptionInputFromJson(json);

  @JsonKey(unknownEnumValue: Enum$NotificationType.$unknown)
  final Enum$NotificationType? type;

  final bool? enabled;

  Map<String, dynamic> toJson() => _$Input$NotificationOptionInputToJson(this);
  int get hashCode {
    final l$type = type;
    final l$enabled = enabled;
    return Object.hashAll([l$type, l$enabled]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$NotificationOptionInput) ||
        runtimeType != other.runtimeType) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) return false;
    return true;
  }

  Input$NotificationOptionInput copyWith(
          {Enum$NotificationType? Function()? type,
          bool? Function()? enabled}) =>
      Input$NotificationOptionInput(
          type: type == null ? this.type : type(),
          enabled: enabled == null ? this.enabled : enabled());
}

@JsonSerializable(explicitToJson: true)
class Input$StaffNameInput {
  Input$StaffNameInput(
      {this.first, this.middle, this.last, this.native, this.alternative});

  @override
  factory Input$StaffNameInput.fromJson(Map<String, dynamic> json) =>
      _$Input$StaffNameInputFromJson(json);

  final String? first;

  final String? middle;

  final String? last;

  final String? native;

  final List<String?>? alternative;

  Map<String, dynamic> toJson() => _$Input$StaffNameInputToJson(this);
  int get hashCode {
    final l$first = first;
    final l$middle = middle;
    final l$last = last;
    final l$native = native;
    final l$alternative = alternative;
    return Object.hashAll([
      l$first,
      l$middle,
      l$last,
      l$native,
      l$alternative == null ? null : Object.hashAll(l$alternative.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$StaffNameInput) || runtimeType != other.runtimeType)
      return false;
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) return false;
    final l$middle = middle;
    final lOther$middle = other.middle;
    if (l$middle != lOther$middle) return false;
    final l$last = last;
    final lOther$last = other.last;
    if (l$last != lOther$last) return false;
    final l$native = native;
    final lOther$native = other.native;
    if (l$native != lOther$native) return false;
    final l$alternative = alternative;
    final lOther$alternative = other.alternative;
    if (l$alternative != null && lOther$alternative != null) {
      if (l$alternative.length != lOther$alternative.length) return false;
      for (int i = 0; i < l$alternative.length; i++) {
        final l$alternative$entry = l$alternative[i];
        final lOther$alternative$entry = lOther$alternative[i];
        if (l$alternative$entry != lOther$alternative$entry) return false;
      }
    } else if (l$alternative != lOther$alternative) {
      return false;
    }

    return true;
  }

  Input$StaffNameInput copyWith(
          {String? Function()? first,
          String? Function()? middle,
          String? Function()? last,
          String? Function()? native,
          List<String?>? Function()? alternative}) =>
      Input$StaffNameInput(
          first: first == null ? this.first : first(),
          middle: middle == null ? this.middle : middle(),
          last: last == null ? this.last : last(),
          native: native == null ? this.native : native(),
          alternative: alternative == null ? this.alternative : alternative());
}

enum Enum$ActivitySort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('PINNED')
  PINNED,
  $unknown
}

enum Enum$ActivityType {
  @JsonValue('TEXT')
  TEXT,
  @JsonValue('ANIME_LIST')
  ANIME_LIST,
  @JsonValue('MANGA_LIST')
  MANGA_LIST,
  @JsonValue('MESSAGE')
  MESSAGE,
  @JsonValue('MEDIA_LIST')
  MEDIA_LIST,
  $unknown
}

enum Enum$AiringSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('MEDIA_ID')
  MEDIA_ID,
  @JsonValue('MEDIA_ID_DESC')
  MEDIA_ID_DESC,
  @JsonValue('TIME')
  TIME,
  @JsonValue('TIME_DESC')
  TIME_DESC,
  @JsonValue('EPISODE')
  EPISODE,
  @JsonValue('EPISODE_DESC')
  EPISODE_DESC,
  $unknown
}

enum Enum$CharacterRole {
  @JsonValue('MAIN')
  MAIN,
  @JsonValue('SUPPORTING')
  SUPPORTING,
  @JsonValue('BACKGROUND')
  BACKGROUND,
  $unknown
}

enum Enum$CharacterSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('ROLE')
  ROLE,
  @JsonValue('ROLE_DESC')
  ROLE_DESC,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  @JsonValue('FAVOURITES')
  FAVOURITES,
  @JsonValue('FAVOURITES_DESC')
  FAVOURITES_DESC,
  @JsonValue('RELEVANCE')
  RELEVANCE,
  $unknown
}

enum Enum$ExternalLinkMediaType {
  @JsonValue('ANIME')
  ANIME,
  @JsonValue('MANGA')
  MANGA,
  @JsonValue('STAFF')
  STAFF,
  $unknown
}

enum Enum$ExternalLinkType {
  @JsonValue('INFO')
  INFO,
  @JsonValue('STREAMING')
  STREAMING,
  @JsonValue('SOCIAL')
  SOCIAL,
  $unknown
}

enum Enum$LikeableType {
  @JsonValue('THREAD')
  THREAD,
  @JsonValue('THREAD_COMMENT')
  THREAD_COMMENT,
  @JsonValue('ACTIVITY')
  ACTIVITY,
  @JsonValue('ACTIVITY_REPLY')
  ACTIVITY_REPLY,
  $unknown
}

enum Enum$MediaFormat {
  @JsonValue('TV')
  TV,
  @JsonValue('TV_SHORT')
  TV_SHORT,
  @JsonValue('MOVIE')
  MOVIE,
  @JsonValue('SPECIAL')
  SPECIAL,
  @JsonValue('OVA')
  OVA,
  @JsonValue('ONA')
  ONA,
  @JsonValue('MUSIC')
  MUSIC,
  @JsonValue('MANGA')
  MANGA,
  @JsonValue('NOVEL')
  NOVEL,
  @JsonValue('ONE_SHOT')
  ONE_SHOT,
  $unknown
}

enum Enum$MediaListSort {
  @JsonValue('MEDIA_ID')
  MEDIA_ID,
  @JsonValue('MEDIA_ID_DESC')
  MEDIA_ID_DESC,
  @JsonValue('SCORE')
  SCORE,
  @JsonValue('SCORE_DESC')
  SCORE_DESC,
  @JsonValue('STATUS')
  STATUS,
  @JsonValue('STATUS_DESC')
  STATUS_DESC,
  @JsonValue('PROGRESS')
  PROGRESS,
  @JsonValue('PROGRESS_DESC')
  PROGRESS_DESC,
  @JsonValue('PROGRESS_VOLUMES')
  PROGRESS_VOLUMES,
  @JsonValue('PROGRESS_VOLUMES_DESC')
  PROGRESS_VOLUMES_DESC,
  @JsonValue('REPEAT')
  REPEAT,
  @JsonValue('REPEAT_DESC')
  REPEAT_DESC,
  @JsonValue('PRIORITY')
  PRIORITY,
  @JsonValue('PRIORITY_DESC')
  PRIORITY_DESC,
  @JsonValue('STARTED_ON')
  STARTED_ON,
  @JsonValue('STARTED_ON_DESC')
  STARTED_ON_DESC,
  @JsonValue('FINISHED_ON')
  FINISHED_ON,
  @JsonValue('FINISHED_ON_DESC')
  FINISHED_ON_DESC,
  @JsonValue('ADDED_TIME')
  ADDED_TIME,
  @JsonValue('ADDED_TIME_DESC')
  ADDED_TIME_DESC,
  @JsonValue('UPDATED_TIME')
  UPDATED_TIME,
  @JsonValue('UPDATED_TIME_DESC')
  UPDATED_TIME_DESC,
  @JsonValue('MEDIA_TITLE_ROMAJI')
  MEDIA_TITLE_ROMAJI,
  @JsonValue('MEDIA_TITLE_ROMAJI_DESC')
  MEDIA_TITLE_ROMAJI_DESC,
  @JsonValue('MEDIA_TITLE_ENGLISH')
  MEDIA_TITLE_ENGLISH,
  @JsonValue('MEDIA_TITLE_ENGLISH_DESC')
  MEDIA_TITLE_ENGLISH_DESC,
  @JsonValue('MEDIA_TITLE_NATIVE')
  MEDIA_TITLE_NATIVE,
  @JsonValue('MEDIA_TITLE_NATIVE_DESC')
  MEDIA_TITLE_NATIVE_DESC,
  @JsonValue('MEDIA_POPULARITY')
  MEDIA_POPULARITY,
  @JsonValue('MEDIA_POPULARITY_DESC')
  MEDIA_POPULARITY_DESC,
  $unknown
}

enum Enum$MediaListStatus {
  @JsonValue('CURRENT')
  CURRENT,
  @JsonValue('PLANNING')
  PLANNING,
  @JsonValue('COMPLETED')
  COMPLETED,
  @JsonValue('DROPPED')
  DROPPED,
  @JsonValue('PAUSED')
  PAUSED,
  @JsonValue('REPEATING')
  REPEATING,
  $unknown
}

enum Enum$MediaRankType {
  @JsonValue('RATED')
  RATED,
  @JsonValue('POPULAR')
  POPULAR,
  $unknown
}

enum Enum$MediaRelation {
  @JsonValue('ADAPTATION')
  ADAPTATION,
  @JsonValue('PREQUEL')
  PREQUEL,
  @JsonValue('SEQUEL')
  SEQUEL,
  @JsonValue('PARENT')
  PARENT,
  @JsonValue('SIDE_STORY')
  SIDE_STORY,
  @JsonValue('CHARACTER')
  CHARACTER,
  @JsonValue('SUMMARY')
  SUMMARY,
  @JsonValue('ALTERNATIVE')
  ALTERNATIVE,
  @JsonValue('SPIN_OFF')
  SPIN_OFF,
  @JsonValue('OTHER')
  OTHER,
  @JsonValue('SOURCE')
  SOURCE,
  @JsonValue('COMPILATION')
  COMPILATION,
  @JsonValue('CONTAINS')
  CONTAINS,
  $unknown
}

enum Enum$MediaSeason {
  @JsonValue('WINTER')
  WINTER,
  @JsonValue('SPRING')
  SPRING,
  @JsonValue('SUMMER')
  SUMMER,
  @JsonValue('FALL')
  FALL,
  $unknown
}

enum Enum$MediaSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('TITLE_ROMAJI')
  TITLE_ROMAJI,
  @JsonValue('TITLE_ROMAJI_DESC')
  TITLE_ROMAJI_DESC,
  @JsonValue('TITLE_ENGLISH')
  TITLE_ENGLISH,
  @JsonValue('TITLE_ENGLISH_DESC')
  TITLE_ENGLISH_DESC,
  @JsonValue('TITLE_NATIVE')
  TITLE_NATIVE,
  @JsonValue('TITLE_NATIVE_DESC')
  TITLE_NATIVE_DESC,
  @JsonValue('TYPE')
  TYPE,
  @JsonValue('TYPE_DESC')
  TYPE_DESC,
  @JsonValue('FORMAT')
  FORMAT,
  @JsonValue('FORMAT_DESC')
  FORMAT_DESC,
  @JsonValue('START_DATE')
  START_DATE,
  @JsonValue('START_DATE_DESC')
  START_DATE_DESC,
  @JsonValue('END_DATE')
  END_DATE,
  @JsonValue('END_DATE_DESC')
  END_DATE_DESC,
  @JsonValue('SCORE')
  SCORE,
  @JsonValue('SCORE_DESC')
  SCORE_DESC,
  @JsonValue('POPULARITY')
  POPULARITY,
  @JsonValue('POPULARITY_DESC')
  POPULARITY_DESC,
  @JsonValue('TRENDING')
  TRENDING,
  @JsonValue('TRENDING_DESC')
  TRENDING_DESC,
  @JsonValue('EPISODES')
  EPISODES,
  @JsonValue('EPISODES_DESC')
  EPISODES_DESC,
  @JsonValue('DURATION')
  DURATION,
  @JsonValue('DURATION_DESC')
  DURATION_DESC,
  @JsonValue('STATUS')
  STATUS,
  @JsonValue('STATUS_DESC')
  STATUS_DESC,
  @JsonValue('CHAPTERS')
  CHAPTERS,
  @JsonValue('CHAPTERS_DESC')
  CHAPTERS_DESC,
  @JsonValue('VOLUMES')
  VOLUMES,
  @JsonValue('VOLUMES_DESC')
  VOLUMES_DESC,
  @JsonValue('UPDATED_AT')
  UPDATED_AT,
  @JsonValue('UPDATED_AT_DESC')
  UPDATED_AT_DESC,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  @JsonValue('FAVOURITES')
  FAVOURITES,
  @JsonValue('FAVOURITES_DESC')
  FAVOURITES_DESC,
  $unknown
}

enum Enum$MediaSource {
  @JsonValue('ORIGINAL')
  ORIGINAL,
  @JsonValue('MANGA')
  MANGA,
  @JsonValue('LIGHT_NOVEL')
  LIGHT_NOVEL,
  @JsonValue('VISUAL_NOVEL')
  VISUAL_NOVEL,
  @JsonValue('VIDEO_GAME')
  VIDEO_GAME,
  @JsonValue('OTHER')
  OTHER,
  @JsonValue('NOVEL')
  NOVEL,
  @JsonValue('DOUJINSHI')
  DOUJINSHI,
  @JsonValue('ANIME')
  ANIME,
  @JsonValue('WEB_NOVEL')
  WEB_NOVEL,
  @JsonValue('LIVE_ACTION')
  LIVE_ACTION,
  @JsonValue('GAME')
  GAME,
  @JsonValue('COMIC')
  COMIC,
  @JsonValue('MULTIMEDIA_PROJECT')
  MULTIMEDIA_PROJECT,
  @JsonValue('PICTURE_BOOK')
  PICTURE_BOOK,
  $unknown
}

enum Enum$MediaStatus {
  @JsonValue('FINISHED')
  FINISHED,
  @JsonValue('RELEASING')
  RELEASING,
  @JsonValue('NOT_YET_RELEASED')
  NOT_YET_RELEASED,
  @JsonValue('CANCELLED')
  CANCELLED,
  @JsonValue('HIATUS')
  HIATUS,
  $unknown
}

enum Enum$MediaTrendSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('MEDIA_ID')
  MEDIA_ID,
  @JsonValue('MEDIA_ID_DESC')
  MEDIA_ID_DESC,
  @JsonValue('DATE')
  DATE,
  @JsonValue('DATE_DESC')
  DATE_DESC,
  @JsonValue('SCORE')
  SCORE,
  @JsonValue('SCORE_DESC')
  SCORE_DESC,
  @JsonValue('POPULARITY')
  POPULARITY,
  @JsonValue('POPULARITY_DESC')
  POPULARITY_DESC,
  @JsonValue('TRENDING')
  TRENDING,
  @JsonValue('TRENDING_DESC')
  TRENDING_DESC,
  @JsonValue('EPISODE')
  EPISODE,
  @JsonValue('EPISODE_DESC')
  EPISODE_DESC,
  $unknown
}

enum Enum$MediaType {
  @JsonValue('ANIME')
  ANIME,
  @JsonValue('MANGA')
  MANGA,
  $unknown
}

enum Enum$ModActionType {
  @JsonValue('NOTE')
  NOTE,
  @JsonValue('BAN')
  BAN,
  @JsonValue('DELETE')
  DELETE,
  @JsonValue('EDIT')
  EDIT,
  @JsonValue('EXPIRE')
  EXPIRE,
  @JsonValue('REPORT')
  REPORT,
  @JsonValue('RESET')
  RESET,
  @JsonValue('ANON')
  ANON,
  $unknown
}

enum Enum$ModRole {
  @JsonValue('ADMIN')
  ADMIN,
  @JsonValue('LEAD_DEVELOPER')
  LEAD_DEVELOPER,
  @JsonValue('DEVELOPER')
  DEVELOPER,
  @JsonValue('LEAD_COMMUNITY')
  LEAD_COMMUNITY,
  @JsonValue('COMMUNITY')
  COMMUNITY,
  @JsonValue('DISCORD_COMMUNITY')
  DISCORD_COMMUNITY,
  @JsonValue('LEAD_ANIME_DATA')
  LEAD_ANIME_DATA,
  @JsonValue('ANIME_DATA')
  ANIME_DATA,
  @JsonValue('LEAD_MANGA_DATA')
  LEAD_MANGA_DATA,
  @JsonValue('MANGA_DATA')
  MANGA_DATA,
  @JsonValue('LEAD_SOCIAL_MEDIA')
  LEAD_SOCIAL_MEDIA,
  @JsonValue('SOCIAL_MEDIA')
  SOCIAL_MEDIA,
  @JsonValue('RETIRED')
  RETIRED,
  $unknown
}

enum Enum$NotificationType {
  @JsonValue('ACTIVITY_MESSAGE')
  ACTIVITY_MESSAGE,
  @JsonValue('ACTIVITY_REPLY')
  ACTIVITY_REPLY,
  @JsonValue('FOLLOWING')
  FOLLOWING,
  @JsonValue('ACTIVITY_MENTION')
  ACTIVITY_MENTION,
  @JsonValue('THREAD_COMMENT_MENTION')
  THREAD_COMMENT_MENTION,
  @JsonValue('THREAD_SUBSCRIBED')
  THREAD_SUBSCRIBED,
  @JsonValue('THREAD_COMMENT_REPLY')
  THREAD_COMMENT_REPLY,
  @JsonValue('AIRING')
  AIRING,
  @JsonValue('ACTIVITY_LIKE')
  ACTIVITY_LIKE,
  @JsonValue('ACTIVITY_REPLY_LIKE')
  ACTIVITY_REPLY_LIKE,
  @JsonValue('THREAD_LIKE')
  THREAD_LIKE,
  @JsonValue('THREAD_COMMENT_LIKE')
  THREAD_COMMENT_LIKE,
  @JsonValue('ACTIVITY_REPLY_SUBSCRIBED')
  ACTIVITY_REPLY_SUBSCRIBED,
  @JsonValue('RELATED_MEDIA_ADDITION')
  RELATED_MEDIA_ADDITION,
  @JsonValue('MEDIA_DATA_CHANGE')
  MEDIA_DATA_CHANGE,
  @JsonValue('MEDIA_MERGE')
  MEDIA_MERGE,
  @JsonValue('MEDIA_DELETION')
  MEDIA_DELETION,
  $unknown
}

enum Enum$RecommendationRating {
  @JsonValue('NO_RATING')
  NO_RATING,
  @JsonValue('RATE_UP')
  RATE_UP,
  @JsonValue('RATE_DOWN')
  RATE_DOWN,
  $unknown
}

enum Enum$RecommendationSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('RATING')
  RATING,
  @JsonValue('RATING_DESC')
  RATING_DESC,
  $unknown
}

enum Enum$ReviewRating {
  @JsonValue('NO_VOTE')
  NO_VOTE,
  @JsonValue('UP_VOTE')
  UP_VOTE,
  @JsonValue('DOWN_VOTE')
  DOWN_VOTE,
  $unknown
}

enum Enum$ReviewSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('SCORE')
  SCORE,
  @JsonValue('SCORE_DESC')
  SCORE_DESC,
  @JsonValue('RATING')
  RATING,
  @JsonValue('RATING_DESC')
  RATING_DESC,
  @JsonValue('CREATED_AT')
  CREATED_AT,
  @JsonValue('CREATED_AT_DESC')
  CREATED_AT_DESC,
  @JsonValue('UPDATED_AT')
  UPDATED_AT,
  @JsonValue('UPDATED_AT_DESC')
  UPDATED_AT_DESC,
  $unknown
}

enum Enum$RevisionHistoryAction {
  @JsonValue('CREATE')
  CREATE,
  @JsonValue('EDIT')
  EDIT,
  $unknown
}

enum Enum$ScoreFormat {
  @JsonValue('POINT_100')
  POINT_100,
  @JsonValue('POINT_10_DECIMAL')
  POINT_10_DECIMAL,
  @JsonValue('POINT_10')
  POINT_10,
  @JsonValue('POINT_5')
  POINT_5,
  @JsonValue('POINT_3')
  POINT_3,
  $unknown
}

enum Enum$SiteTrendSort {
  @JsonValue('DATE')
  DATE,
  @JsonValue('DATE_DESC')
  DATE_DESC,
  @JsonValue('COUNT')
  COUNT,
  @JsonValue('COUNT_DESC')
  COUNT_DESC,
  @JsonValue('CHANGE')
  CHANGE,
  @JsonValue('CHANGE_DESC')
  CHANGE_DESC,
  $unknown
}

enum Enum$StaffLanguage {
  @JsonValue('JAPANESE')
  JAPANESE,
  @JsonValue('ENGLISH')
  ENGLISH,
  @JsonValue('KOREAN')
  KOREAN,
  @JsonValue('ITALIAN')
  ITALIAN,
  @JsonValue('SPANISH')
  SPANISH,
  @JsonValue('PORTUGUESE')
  PORTUGUESE,
  @JsonValue('FRENCH')
  FRENCH,
  @JsonValue('GERMAN')
  GERMAN,
  @JsonValue('HEBREW')
  HEBREW,
  @JsonValue('HUNGARIAN')
  HUNGARIAN,
  $unknown
}

enum Enum$StaffSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('ROLE')
  ROLE,
  @JsonValue('ROLE_DESC')
  ROLE_DESC,
  @JsonValue('LANGUAGE')
  LANGUAGE,
  @JsonValue('LANGUAGE_DESC')
  LANGUAGE_DESC,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  @JsonValue('FAVOURITES')
  FAVOURITES,
  @JsonValue('FAVOURITES_DESC')
  FAVOURITES_DESC,
  @JsonValue('RELEVANCE')
  RELEVANCE,
  $unknown
}

enum Enum$StudioSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('NAME')
  NAME,
  @JsonValue('NAME_DESC')
  NAME_DESC,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  @JsonValue('FAVOURITES')
  FAVOURITES,
  @JsonValue('FAVOURITES_DESC')
  FAVOURITES_DESC,
  $unknown
}

enum Enum$SubmissionSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  $unknown
}

enum Enum$SubmissionStatus {
  @JsonValue('PENDING')
  PENDING,
  @JsonValue('REJECTED')
  REJECTED,
  @JsonValue('PARTIALLY_ACCEPTED')
  PARTIALLY_ACCEPTED,
  @JsonValue('ACCEPTED')
  ACCEPTED,
  $unknown
}

enum Enum$ThreadCommentSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  $unknown
}

enum Enum$ThreadSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('TITLE')
  TITLE,
  @JsonValue('TITLE_DESC')
  TITLE_DESC,
  @JsonValue('CREATED_AT')
  CREATED_AT,
  @JsonValue('CREATED_AT_DESC')
  CREATED_AT_DESC,
  @JsonValue('UPDATED_AT')
  UPDATED_AT,
  @JsonValue('UPDATED_AT_DESC')
  UPDATED_AT_DESC,
  @JsonValue('REPLIED_AT')
  REPLIED_AT,
  @JsonValue('REPLIED_AT_DESC')
  REPLIED_AT_DESC,
  @JsonValue('REPLY_COUNT')
  REPLY_COUNT,
  @JsonValue('REPLY_COUNT_DESC')
  REPLY_COUNT_DESC,
  @JsonValue('VIEW_COUNT')
  VIEW_COUNT,
  @JsonValue('VIEW_COUNT_DESC')
  VIEW_COUNT_DESC,
  @JsonValue('IS_STICKY')
  IS_STICKY,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  $unknown
}

enum Enum$UserSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('USERNAME')
  USERNAME,
  @JsonValue('USERNAME_DESC')
  USERNAME_DESC,
  @JsonValue('WATCHED_TIME')
  WATCHED_TIME,
  @JsonValue('WATCHED_TIME_DESC')
  WATCHED_TIME_DESC,
  @JsonValue('CHAPTERS_READ')
  CHAPTERS_READ,
  @JsonValue('CHAPTERS_READ_DESC')
  CHAPTERS_READ_DESC,
  @JsonValue('SEARCH_MATCH')
  SEARCH_MATCH,
  $unknown
}

enum Enum$UserStaffNameLanguage {
  @JsonValue('ROMAJI_WESTERN')
  ROMAJI_WESTERN,
  @JsonValue('ROMAJI')
  ROMAJI,
  @JsonValue('NATIVE')
  NATIVE,
  $unknown
}

enum Enum$UserStatisticsSort {
  @JsonValue('ID')
  ID,
  @JsonValue('ID_DESC')
  ID_DESC,
  @JsonValue('COUNT')
  COUNT,
  @JsonValue('COUNT_DESC')
  COUNT_DESC,
  @JsonValue('PROGRESS')
  PROGRESS,
  @JsonValue('PROGRESS_DESC')
  PROGRESS_DESC,
  @JsonValue('MEAN_SCORE')
  MEAN_SCORE,
  @JsonValue('MEAN_SCORE_DESC')
  MEAN_SCORE_DESC,
  $unknown
}

enum Enum$UserTitleLanguage {
  @JsonValue('ROMAJI')
  ROMAJI,
  @JsonValue('ENGLISH')
  ENGLISH,
  @JsonValue('NATIVE')
  NATIVE,
  @JsonValue('ROMAJI_STYLISED')
  ROMAJI_STYLISED,
  @JsonValue('ENGLISH_STYLISED')
  ENGLISH_STYLISED,
  @JsonValue('NATIVE_STYLISED')
  NATIVE_STYLISED,
  $unknown
}

const possibleTypesMap = {
  'ActivityUnion': {'TextActivity', 'ListActivity', 'MessageActivity'},
  'LikeableUnion': {
    'ListActivity',
    'TextActivity',
    'MessageActivity',
    'ActivityReply',
    'Thread',
    'ThreadComment'
  },
  'NotificationUnion': {
    'AiringNotification',
    'FollowingNotification',
    'ActivityMessageNotification',
    'ActivityMentionNotification',
    'ActivityReplyNotification',
    'ActivityReplySubscribedNotification',
    'ActivityLikeNotification',
    'ActivityReplyLikeNotification',
    'ThreadCommentMentionNotification',
    'ThreadCommentReplyNotification',
    'ThreadCommentSubscribedNotification',
    'ThreadCommentLikeNotification',
    'ThreadLikeNotification',
    'RelatedMediaAdditionNotification',
    'MediaDataChangeNotification',
    'MediaMergeNotification',
    'MediaDeletionNotification'
  }
};
