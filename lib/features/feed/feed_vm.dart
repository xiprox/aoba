import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/data/remote/client/client.dart';
import 'package:aoba/data/remote/gql/queries/feed/feed.graphql.dart';
import 'package:veee/veee.dart';

class FeedViewModel extends ViewModel {
  final _client = Client();

  Resource<Query$FetchFeed$Page> initialResource = Resource.loading();

  final activities = <Query$FetchFeed$Page$activities?>[];

  int _page = 1;

  @override
  void onCreate() {
    super.onCreate();
    _loadInitial();
  }

  void _loadInitial() async {
    initialResource = await _client.getFeed(page: _page);
    activities.clear();
    activities.addAll(initialResource.data?.activities ?? []);
    notifyListeners();
  }

  void _loadNextPage() async {
    _page++;
    final resource = await _client.getFeed(page: _page);
    if (resource.isSuccess()) {
      activities.addAll(resource.data?.activities ?? []);
      notifyListeners();
    } else if (resource.isError()) {
      order(ShowSnackBar(resource.error!.message));
    }
  }

  void onShouldFetchNextPage() {
    print('woahaaaaaaaaaaaaaaa');
    _loadNextPage();
  }
}
