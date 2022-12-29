import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/services/services.dart';
import 'package:aoba/widgets/lists/media_list.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart' show Color, ScrollController;
import 'package:flutter/services.dart';
import 'package:veee/veee.dart';

import 'data/lists_repo.dart';

class ListsViewModel extends ViewModel {
  final int userId;
  final Color? color;

  MediaType filterMediaType = MediaType.ANIME;
  ListDisplayType displayType = ListDisplayType.grid;

  ListsViewModel({
    required this.userId,
    this.color,
  });

  final _userInfo = get<UserInfo>();
  final _repo = get<ListsRepo>();

  final scrollController = ScrollController();

  Resource<ListsData> data = const Resource(loading: true);

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
    return _userInfo.id == userId;
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

  bool get canEditEntries => _isOwnLibrary;

  void onEntryPress(MediaListEntry entry) {}

  void onEntryEditPress(MediaListEntry entry) {}
}
