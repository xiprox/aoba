import 'package:aoba/mixins/vm_deferred_action_mixin.dart';
import 'package:aoba/mixins/vm_stream_subscription_manager_mixin.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart' show Color;
import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:aoba/mixins/paginated_fetch_mixin.dart';
import 'package:aoba/services/services.dart';

import 'data/feed_repo.dart';

class OpenProfile extends ViewModelOrder {
  final int? userId;
  final Color? color;
  const OpenProfile({this.userId, this.color});
}

class FeedViewModel extends ViewModel
    with
        InfiniteScrollMixin,
        PaginatedDataMixin<Activity?>,
        StreamSubscriptionManagerMixin,
        DeferredActionMixin {
  final _repo = get<FeedRepo>();
  final _ping = get<PingService>();

  Resource<List<Activity?>> get activities => paginatedResource;

  bool followingOnly = true;

  @override
  void onCreate() {
    super.onCreate();
    fetchFromTheStart();

    manage(_ping.listen(PingType.quickUpdateHappened, onQuickUpdateHappened));
  }

  @override
  Future<Resource<List<Activity?>>> fetchPage(
    int page,
    bool forceNetwork,
  ) async {
    final resource = await _repo.getFeed(
      page: page,
      followingOnly: followingOnly,
      forceNetwork: forceNetwork,
    );
    return resource.transform((data) => data.Page?.activities ?? []);
  }

  @override
  void onFetchPageFailed(ErrorInfo? error) {
    order(ShowSnackBar(error?.message ?? ''));
  }

  void onQuickUpdateHappened() {
    // Fefreshing when on the global feed is pointless as our update will be
    // drowned immediately.
    if (followingOnly) {
      execute(
        action: () => fetchFromTheStart(silent: page == 1, forceNetwork: true),
        after: const Duration(seconds: 2),
        key: 'quick_update_refresh',
      );
    }
  }

  Future onPulledToRefresh() {
    return fetchFromTheStart(silent: true, forceNetwork: true);
  }

  void onFollowingOnlyChange(bool value) async {
    if (value == followingOnly) return;
    followingOnly = value;
    fetchFromTheStart();
  }

  void onProfilePress() {
    order(const OpenProfile());
  }

  void onUserPress(int id, Color? color) {
    order(OpenProfile(userId: id, color: color));
  }

  void onLogoutPress() async {
    await get<Credentials>().clear();
    await get<UserInfo>().clear();
    get<AppRouter>().replaceAll([const HomeRoute()]);
  }
}
