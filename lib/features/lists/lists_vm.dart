import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
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

class ListsViewModel extends ViewModel {
  final int userId;
  final Color? color;

  ListsViewModel({
    required this.userId,
    this.color,
  });

  final _prefs = get<Preferences>();
  final _db = get<Database>();
  final _repo = get<ListsRepo>();

  final scrollController = ScrollController();

  Resource<ListsData> data = const Resource(loading: true);

  MediaType filterMediaType = MediaType.ANIME;

  late ListDisplayType optionDisplayType = _prefs.get().lists.displayType;

  int animeIndex = 0;
  int mangaIndex = 0;

  @override
  void onCreate() {
    super.onCreate();
    fetch();
  }

  void fetch() async {
    data = await _repo.getData(userId: userId, type: filterMediaType);
    notifyListeners();
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
    _prefs.update((it) => it.lists.displayType = value);
    optionDisplayType = value;
    notifyListeners();
  }

  bool get canEditEntries => _isOwnLibrary;

  void onEntryPress(MediaListEntry entry) {}

  void onEntryEditPress(MediaListEntry entry) {}
}
