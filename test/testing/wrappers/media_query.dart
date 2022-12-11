import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterMediaQueryExt on WidgetTester {
  Future<void> pumpWidgetDirectionality(Widget widget) {
    return pumpWidget(MediaQueryWrapper(child: widget));
  }
}

class MediaQueryWrapper extends StatelessWidget {
  final Widget child;
  const MediaQueryWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: child,
    );
  }
}
