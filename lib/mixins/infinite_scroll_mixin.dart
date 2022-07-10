import 'package:flutter/widgets.dart';

mixin InfiniteScrollMixin {
  final _controller = ScrollController();

  /// How far from the max scroll extend should we fetch the next page.
  final infiniteScrollTriggerWindow = 400.0;

  ScrollController infiniteScroll(Function onShouldFetchNextPage) {
    bool free = true;
    _controller.addListener(() {
      final position = _controller.position;
      final threshold = position.maxScrollExtent - infiniteScrollTriggerWindow;
      if (free && position.pixels >= threshold) {
        free = false;
        onShouldFetchNextPage();
      } else if (position.pixels < threshold) {
        free = true;
      }
    });
    return _controller;
  }
}
