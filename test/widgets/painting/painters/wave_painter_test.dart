import 'package:aoba/widgets/painting/painters/wave_painter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Painter paints correctly', (tester) async {
    await tester.pumpWidget(
      const RepaintBoundary(
        child: CustomPaint(
          painter: WavePainter(
            color: Color(0xff2ff21a),
            wavelength: 12 * 2,
          ),
          size: Size(120, 16),
        ),
      ),
    );
    expectLater(
      find.byType(RepaintBoundary),
      matchesGoldenFile('wave_painter.png'),
    );
  });
}
