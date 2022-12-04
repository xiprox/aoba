import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:aoba/mixins/paginated_fetch_mixin.dart';
import 'package:aoba/services/services.dart';
import 'package:veee/veee.dart';

import 'data/profile_repo.dart';

class ProfileViewModel extends ViewModel
    with InfiniteScrollMixin, PaginatedDataMixin<Activity?> {
  final int userId;

  ProfileViewModel({required this.userId});

  final _repo = get<ProfileRepo>();

  Resource<User> info = Resource.loading();
  Resource<List<Activity?>> get activities => paginatedResource;

  @override
  void onCreate() {
    super.onCreate();
    fetchInfo();
    fetchFromTheStart();
  }

  void fetchInfo() async {
    info = await _repo.getInfo(userId: userId);
    notifyListeners();
  }

  @override
  Future<Resource<List<Activity?>>> fetchPage(int page) async {
    final resource = await _repo.getFeed(userId: userId, page: page);
    return resource.transform((data) => data.Page?.activities ?? []);
  }

  @override
  void onFetchPageFailed(ErrorInfo? error) {
    order(ShowSnackBar(error?.message ?? ''));
  }
}
