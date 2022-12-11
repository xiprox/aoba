import 'package:flutter/material.dart' show Curves, protected;
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';

mixin PaginatedDataMixin<T> on InfiniteScrollMixin {
  /// The current page.
  @protected
  int page = 1;

  Resource<List<T>> paginatedResource = const Resource(loading: true);

  @override
  void onScrollEndReached() {
    _fetchNextPage();
  }

  void fetchFromTheStart({
    bool silent = false,
    bool forceNetwork = false,
  }) async {
    page = 1;
    if (scrollController.hasClients) {
      await scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
      );
    }
    _fetchFirstPage(silent, forceNetwork);
  }

  Future<Resource<List<T>>> fetchPage(int page, bool forceNetwork) {
    throw UnimplementedError();
  }

  void _fetchFirstPage(bool silent, bool forceNetwork) async {
    if (!paginatedResource.isLoading && !silent) {
      paginatedResource = const Resource(loading: true);
      notifyListeners();
    }
    paginatedResource = await fetchPage(page, forceNetwork);
    notifyListeners();
  }

  void _fetchNextPage() async {
    if (paginatedResource.data == null) {
      // No point trying to fetch anything else if the first request failed.
      return;
    }

    final resource = await fetchPage(++page, false);
    if (resource.data != null) {
      paginatedResource.data!.addAll(resource.data!);
      notifyListeners();
    } else if (resource.error != null) {
      onFetchPageFailed(resource.error);
    }
  }

  void onFetchPageFailed(ErrorInfo? error) {}
}
