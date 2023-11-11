import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/vm_stream_subscription_manager_mixin.dart';
import 'package:aoba/services/services.dart';
import 'package:aoba/widgets/lists/media_list.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart' show Color, ScrollController;
import 'package:flutter/services.dart';
import 'package:veee/veee.dart';

import 'data/lists_repo.dart';

class OpenOptions extends ViewModelOrder {
  final Offset triggerPosition;
  OpenOptions({required this.triggerPosition});
}

class OpenEntryUpdate extends ViewModelOrder {
  final MediaListEntry entry;
  final ScoreFormat scoreFormat;
  final Color? color;
  const OpenEntryUpdate({
    required this.entry,
    required this.scoreFormat,
    this.color,
  });
}

class ListsViewModel extends ViewModel with StreamSubscriptionManagerMixin {
  final int userId;
  final Color? color;

  ListsViewModel({
    required this.userId,
    this.color,
  });

  final _prefs = get<Preferences>();
  final _db = get<Database>();
  final _repo = get<ListsRepo>();
  final _ping = get<PingService>();

  final scrollController = ScrollController();

  Resource<ListsData> data = const Resource(loading: true);

  MediaType filterMediaType = MediaType.ANIME;

  late ListDisplayType optionDisplayType = _prefs.get().lists.displayType;
  late MediaListSort optionSort = _prefs.get().lists.sort;

  int animeIndex = 0;
  int mangaIndex = 0;

  @override
  void onCreate() {
    super.onCreate();
    fetch();

    manage(_ping.listen(PingType.mediaListEntryUpdated, onListEntryUpdated));
  }

  void fetch({bool forceNetwork = false}) async {
    data = await _repo.getData(
      userId: userId,
      type: filterMediaType,
      sort: [optionSort],
      forceNetwork: forceNetwork,
    );
    notifyListeners();
  }

  void onListEntryUpdated() {
    fetch(forceNetwork: true);
  }

  bool get _isOwnLibrary {
    final value = _db.userInfo.id == userId;
    return value;
  }

  String get appBarTitle {
    if (_isOwnLibrary) {
      return 'My Lists';
    } else if (data.isLoading && data.data?.user?.name == null) {
      return '';
    } else {
      final username = data.data?.user?.name;
      return username != null
          ? '${username.withApostrophe()} Lists'
          : 'User\'s Lists';
    }
  }

  void onTabChanged(int index) {
    if (filterMediaType == MediaType.ANIME) {
      animeIndex = index;
    } else {
      mangaIndex = index;
    }
  }

  void onFilterMediaTypeChange(MediaType first) {
    HapticFeedback.lightImpact();
    filterMediaType = first;
    data = data.copyWith(loading: true);
    notifyListeners();
    fetch();
  }

  void onOptionsPress(Offset triggerPosition) {
    order(OpenOptions(triggerPosition: triggerPosition));
  }

  void onOptionDisplayTypeChange(ListDisplayType value) {
    HapticFeedback.lightImpact();
    _prefs.update((it) => it.lists.displayType = value);
    optionDisplayType = value;
    notifyListeners();
  }

  MediaListSort get titleSortOption {
    final language = data.data?.user?.options?.titleLanguage;
    switch (language) {
      case UserTitleLanguage.ENGLISH:
      case UserTitleLanguage.ENGLISH_STYLISED:
        return MediaListSort.MEDIA_TITLE_ENGLISH;
      case UserTitleLanguage.NATIVE:
      case UserTitleLanguage.NATIVE_STYLISED:
        return MediaListSort.MEDIA_TITLE_NATIVE;
      case UserTitleLanguage.ROMAJI:
      case UserTitleLanguage.ROMAJI_STYLISED:
      default:
        return MediaListSort.MEDIA_TITLE_ROMAJI;
    }
  }

  void onOptionSortChange(MediaListSort value) {
    _prefs.update((it) => it.lists.sort = value);
    optionSort = value;
    data = const Resource(loading: true);
    notifyListeners();
    fetch();
  }

  bool get canEditEntries => _isOwnLibrary;

  void onEntryPress(MediaListEntry entry) {}

  void onEntryEditPress(MediaListEntry entry) {
    order(OpenEntryUpdate(
      entry: entry,
      scoreFormat: data.data?.user?.mediaListOptions?.scoreFormat ??
          ScoreFormat.$unknown,
      color: entry.media?.coverImage?.color?.toColor(),
    ));
  }
}
