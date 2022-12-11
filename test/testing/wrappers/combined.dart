import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'directionality.dart';
import 'media_query.dart';

extension WidgetTesterCombinedWrappersExt on WidgetTester {
  Future<void> pumpWidgetDirectionalityMediaQuery(Widget widget) {
    return pumpWidget(
      DirectionalityWrapper(
        child: MediaQueryWrapper(
          child: widget,
        ),
      ),
    );
  }
}
