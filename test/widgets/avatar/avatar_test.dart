import 'package:aoba/widgets/avatar/avatar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/wrappers/combined.dart';

void main() {
  testWidgets('Calls calback when pressed', (tester) async {
    bool called = false;
    await tester.pumpWidgetDirectionalityMediaQuery(Avatar(
      onPress: () => called = true,
    ));
    await tester.tap(find.byType(Avatar));
    expect(called, true);
  });
}
