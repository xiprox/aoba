import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:aoba/mixins/paginated_fetch_mixin.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

import 'data/feed_repo.dart';

class OpenProfile extends ViewModelOrder {
  final int? userId;
  const OpenProfile([this.userId]);
}

class FeedViewModel extends ViewModel
    with InfiniteScrollMixin, PaginatedDataMixin<Activity?> {
  final _repo = get<FeedRepo>();

  Resource<List<Activity?>> get activities => paginatedResource;

  bool followingOnly = true;

  @override
  void onCreate() {
    super.onCreate();
    fetchFromTheStart();
  }

  @override
  Future<Resource<List<Activity?>>> fetchPage(int page) async {
    final resource = await _repo.getFeed(
      page: page,
      followingOnly: followingOnly,
    );
    return resource.transform((data) => data.Page?.activities ?? []);
  }

  @override
  void onFetchPageFailed(ErrorInfo? error) {
    order(ShowSnackBar(error?.message ?? ''));
  }

  void onFollowingOnlyChange(bool value) async {
    if (value == followingOnly) return;
    followingOnly = value;
    fetchFromTheStart();
  }

  void onProfilePress() {
    order(const OpenProfile());
  }

  void onUserPress(int id) {
    order(OpenProfile(id));
  }

  void onLogoutPress() async {
    await get<Credentials>().clear();
    await get<UserInfo>().clear();
    get<AppRouter>().replaceAll([const HomeRoute()]);
  }
}
