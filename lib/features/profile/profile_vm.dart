import 'package:graphql/client.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart' show Color;
import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';
import 'package:aoba/mixins/paginated_fetch_mixin.dart';
import 'package:aoba/services/services.dart';

import 'data/profile_repo.dart';

class ProfileViewModel extends ViewModel
    with InfiniteScrollMixin, PaginatedDataMixin<Activity?> {
  final int userId;
  final Color? color;

  ProfileViewModel({
    required this.userId,
    this.color,
  });

  final _repo = get<ProfileRepo>();

  Resource<User> info = const Resource(loading: true);
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
  Future<Resource<List<Activity?>>> fetchPage(
    int page,
    bool forceNetwork,
  ) async {
    final resource = await _repo.getFeed(userId: userId, page: page);
    return resource.transform((data) => data.Page?.activities ?? []);
  }

  @override
  void onFetchPageFailed(ErrorInfo? error) {
    order(ShowSnackBar(error?.message ?? ''));
  }
}
