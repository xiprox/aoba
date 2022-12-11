import 'package:aoba/widgets/painting/painters/wave_painter.dart';
import 'package:aoba/widgets/wave/wave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Passes given color to $WavePainter', (tester) async {
    const color = Colors.yellow;
    await tester.pumpWidget(const Wave(
      color: color,
      height: 16,
      wavelength: 16,
    ));
    final paint = tester.widget<CustomPaint>(find.byType(CustomPaint));
    expect(
      paint.painter,
      predicate((it) => it is WavePainter && it.color == color),
    );
  });

  testWidgets('Passes given wavelength to $WavePainter', (tester) async {
    const wavelength = 33.3;
    await tester.pumpWidget(const Wave(
      color: Colors.red,
      height: 16,
      wavelength: wavelength,
    ));
    final paint = tester.widget<CustomPaint>(find.byType(CustomPaint));
    expect(
      paint.painter,
      predicate((it) => it is WavePainter && it.wavelength == wavelength),
    );
  });

  testWidgets('Uses given height', (tester) async {
    const height = 4.0;
    await tester.pumpWidget(const Wave(
      color: Colors.red,
      height: height,
      wavelength: 16,
    ));
    final paint = tester.widget<CustomPaint>(find.byType(CustomPaint));
    expect(paint.size.height, height);
  });
}
