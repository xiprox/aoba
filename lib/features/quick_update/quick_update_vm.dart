import 'package:aoba/consts/consts.dart';
import 'package:collection/collection.dart';
import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:veee/veee.dart';

import 'data/quick_update_repo.dart';

class OpenLists extends ViewModelOrder {}

class QuickUpdateViewModel extends ViewModel {
  final _userInfo = get<UserInfo>();
  final _repo = get<QuickUpdateRepo>();
  final _ping = get<PingService>();

  final scrollController = ScrollController();

  Resource<List<QuickUpdateEntry>> entries = const Resource(loading: true);

  Map<int, Resource<QuickUpdateResult>> updatedEntries = {};

  List<ErrorInfo> get updateErrors => updatedEntries.values
      .where((entry) => entry.error != null)
      .map((entry) => entry.error!)
      .toList();

  @override
  void onCreate() {
    super.onCreate();
    _fetch();
  }

  void _fetch({bool showLoading = true, bool forceRefresh = false}) async {
    entries = Resource(
      loading: showLoading,
      data: showLoading ? null : entries.data,
    );
    notifyListeners();
    entries = await _repo.getEntries(
      userId: _userInfo.id,
      forceNetwork: forceRefresh,
    );
    notifyListeners();
  }

  void onSeeAllListsPress() {
    order(OpenLists());
  }

  void onRefreshPress() => _fetch(showLoading: true, forceRefresh: true);

  void onIncrementEntryPress(int mediaId, int progress) async {
    final fetchedEntry = entries.data?.firstWhereOrNull(
      (entry) => entry.media?.id == mediaId,
    );
    final media = fetchedEntry?.media;

    final existingData = updatedEntries[mediaId]?.data;

    updatedEntries[mediaId] = Resource(loading: true, data: existingData);
    notifyListeners();

    final result = await _repo.updateEntry(
      mediaId: mediaId,
      progress: progress,
    );

    if (result.data != null) {
      updatedEntries[mediaId] = result;

      // If we completed the entry, refetch the list to remove it.
      final maxProgress = media?.episodes ?? media?.chapters ?? 1000000;
      if (progress >= maxProgress) {
        updatedEntries.remove(mediaId);
        _fetch(showLoading: false, forceRefresh: true);
      } else {
        notifyListeners();
      }
      _ping.notify(PingType.quickUpdateHappened);
    } else {
      updatedEntries[mediaId] = result.copyWith(data: existingData);
      notifyListeners();
      await Future.delayed(kErrorDisplayDuration);
      updatedEntries[mediaId] = Resource(
        data: existingData ??
            QuickUpdateResult(
              $__typename: '',
              id: 0,
              mediaId: mediaId,
              progress: fetchedEntry?.progress,
            ),
      );
      notifyListeners();
    }
  }
}
