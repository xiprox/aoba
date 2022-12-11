import 'package:aoba/widgets/tint/tint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/wrappers/directionality.dart';

void main() {
  testWidgets('Uses given color to tint', (tester) async {
    const color = Colors.red;
    await tester.pumpWidgetDirectionality(
      const Tint(
        color: color,
        child: SizedBox(width: 50, height: 50),
      ),
    );
    expect(tester.firstWidget<Container>(find.byType(Container)).color, color);
  });
}
