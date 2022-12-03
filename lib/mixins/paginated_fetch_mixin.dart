import 'package:flutter/material.dart' show Curves;
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/mixins/infinite_scroll_mixin.dart';

mixin PaginatedDataMixin<T> on InfiniteScrollMixin {
  /// The current page.
  int _page = 1;

  Resource<List<T>> paginatedResource = Resource.loading();

  @override
  void onScrollEndReached() {
    _fetchNextPage();
  }

  void fetchFromTheStart() async {
    _page = 1;
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    _fetchFirstPage();
  }

  Future<Resource<List<T>>> fetchPage(int page) {
    throw UnimplementedError();
  }

  void _fetchFirstPage() async {
    if (!paginatedResource.isLoading()) {
      paginatedResource = Resource.loading();
      notifyListeners();
    }
    paginatedResource = await fetchPage(_page);
    notifyListeners();
  }

  void _fetchNextPage() async {
    if (!paginatedResource.isSuccess()) {
      // No point trying to fetch anything else if the first request failed.
      return;
    }

    final resource = await fetchPage(++_page);
    if (resource.isSuccess()) {
      paginatedResource.data!.addAll(resource.data!);
      notifyListeners();
    } else if (resource.isError()) {
      onFetchPageFailed(resource.error);
    }
  }

  void onFetchPageFailed(ErrorInfo? error) {}
}
