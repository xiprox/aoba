import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/features/quick_update/data/quick_update.graphql.dart';
import 'package:aoba/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:veee/veee.dart';

import 'data/quick_update_repo.dart';

class QuickUpdateViewModel extends ViewModel {
  final _repo = get<QuickUpdateRepo>();

  final scrollController = ScrollController();

  Resource<Query$FetchQuickUpdate> entries = Resource.loading();

  @override
  void onCreate() {
    super.onCreate();
    _fetch();
  }

  void _fetch({bool showLoading = true, bool forceRefresh = false}) async {
    entries = Resource.loading(showLoading ? null : entries.data);
    notifyListeners();
    entries = await _repo.getEntries(
      userId: 6071306,
      forceNetwork: forceRefresh,
    );
    notifyListeners();
  }

  void onRefreshPress() => _fetch(showLoading: true, forceRefresh: true);

  void onIncrementEntryPress(int mediaId, int progress) async {
    final result = await _repo.updateEntry(
      mediaId: mediaId,
      progress: progress,
    );
    if (result.isSuccess()) {
      _fetch(showLoading: false);
    } else {
      order(ShowSnackBar(result.error?.message ?? 'Unknown error'));
    }
  }
}
