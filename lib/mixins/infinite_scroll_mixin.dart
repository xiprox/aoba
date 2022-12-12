import 'package:flutter/material.dart' show ScrollController;
import 'package:veee/veee.dart';

mixin InfiniteScrollMixin on ViewModel {
  final scrollController = ScrollController();

  /// How far from the end should we fetch the next page.
  ///
  /// The default implementation aims for 1000 pixels from the end. If the
  /// scrollable area is smaller than that, it chooses half of the max scroll
  /// extent.
  double get infiniteScrollTriggerWindow {
    const desired = 1000.0;
    final max = scrollController.position.maxScrollExtent;
    if (max < desired) {
      return max / 2;
    } else {
      return desired;
    }
  }

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
