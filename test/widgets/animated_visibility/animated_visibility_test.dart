import 'package:aoba/widgets/animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/wrappers/directionality.dart';

void main() {
  testWidgets('Shows given child if visible is true', (tester) async {
    const child = Text('stuff');

    await tester.pumpWidgetDirectionality(const AnimatedVisibility(
      visible: true,
      child: child,
    ));
    await tester.pumpAndSettle();
    expect(find.byWidget(child), findsOneWidget);

    await tester.pumpWidgetDirectionality(const AnimatedVisibility(
      visible: false,
      child: child,
    ));
    await tester.pumpAndSettle();
    expect(find.byWidget(child), findsNothing);
  });
}
