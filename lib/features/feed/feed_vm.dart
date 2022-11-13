import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

import 'feed.gql.dart';

class FeedViewModel extends ViewModel {
  final _repo = get<FeedRepo>();

  Resource<Query$FetchFeed> initialResource = Resource.loading();

  final activities = <Query$FetchFeed$Page$activities?>[];

  int _page = 1;

  bool followingOnly = true;

  @override
  void onCreate() {
    super.onCreate();
    _loadInitial();
  }

  void _loadInitial() async {
    initialResource = await _repo.getFeed(
      page: _page,
      followingOnly: followingOnly,
    );
    activities.clear();
    activities.addAll(initialResource.data?.Page?.activities ?? []);
    notifyListeners();
  }

  void _loadNextPage() async {
    _page++;
    final resource = await _repo.getFeed(
      page: _page,
      followingOnly: followingOnly,
    );
    if (resource.isSuccess()) {
      activities.addAll(resource.data?.Page?.activities ?? []);
      notifyListeners();
    } else if (resource.isError()) {
      order(ShowSnackBar(resource.error!.message));
    }
  }

  void onShouldFetchNextPage() {
    _loadNextPage();
  }

  void onFollowingOnlyChange(bool value) async {
    if (value == followingOnly) return;

    _page = 1;
    followingOnly = value;
    activities.clear();

    initialResource = Resource.loading();
    notifyListeners();

    _loadInitial();
  }

  void onLogoutPress() {
    get<Credentials>().clear();
    get<AppRouter>().popUntilRoot();
    get<AppRouter>().replace(const HomeRoute());
  }
}
