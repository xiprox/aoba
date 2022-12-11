import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterDirectionalityExt on WidgetTester {
  Future<void> pumpWidgetDirectionality(Widget widget) {
    return pumpWidget(DirectionalityWrapper(child: widget));
  }
}

class DirectionalityWrapper extends StatelessWidget {
  final Widget child;
  const DirectionalityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}
