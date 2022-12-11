import 'package:aoba/widgets/avatar/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/consts/consts.dart';
import '../../testing/wrappers/combined.dart';

void main() {
  testWidgets('Uses given image in $CircleAvatar', (tester) async {
    final image = MemoryImage(kTransparentImage);
    await tester.pumpWidgetDirectionalityMediaQuery(Avatar(image: image));
    final widget = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect(widget.foregroundImage, image);
  });

  testWidgets('Uses given padding', (tester) async {
    const padding = EdgeInsets.all(10);
    await tester.pumpWidgetDirectionalityMediaQuery(Avatar(
      image: MemoryImage(kTransparentImage),
      imagePadding: padding,
    ));
    final widget = tester.firstWidget<Padding>(find.byType(Padding));
    expect(widget.padding, padding);
  });

  testWidgets('Calls calback when pressed', (tester) async {
    bool called = false;
    await tester.pumpWidgetDirectionalityMediaQuery(Avatar(
      onPress: () => called = true,
    ));
    await tester.tap(find.byType(Avatar));
    expect(called, true);
  });
}
