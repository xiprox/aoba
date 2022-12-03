import 'package:flutter/material.dart' show ScrollController;
import 'package:veee/veee.dart';

mixin InfiniteScrollMixin on ViewModel {
  final scrollController = ScrollController();

  /// How far from the end should we fetch the next page.
  final infiniteScrollTriggerWindow = 400.0;

  @override
  void onCreate() {
    super.onCreate();
    _infiniteScroll();
  }

  void _infiniteScroll() {
    bool free = true;
    scrollController.addListener(() {
      final position = scrollController.position;
      final threshold = position.maxScrollExtent - infiniteScrollTriggerWindow;
      if (free && position.pixels >= threshold) {
        free = false;
        onScrollEndReached();
      } else if (position.pixels < threshold) {
        free = true;
      }
    });
  }

  /// Called when the user reaches the end of the scrollable area.
  void onScrollEndReached() {}
}
