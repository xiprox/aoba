import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterDirectionalityExt on WidgetTester {
  Future<void> pumpWidgetDirectionality(Widget widget) {
    return pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: widget,
      ),
    );
  }
}
