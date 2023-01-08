import 'package:aoba/widgets/painting/paths/wave_line_path.dart';
import 'package:flutter/material.dart';

class WaveLinePainter extends CustomPainter {
  final Color color;
  final double? strokeWidth;
  final double wavelength;
  final bool? startFromTop;
  final WaveLineDirection? direction;

  const WaveLinePainter({
    required this.color,
    this.strokeWidth,
    required this.wavelength,
    this.startFromTop,
    this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? 2;
    final path = WaveLinePath.get(
      length: size.width,
      amplitude: size.height,
      wavelength: wavelength,
      startFromTop: startFromTop == true,
      direction: direction ?? WaveLineDirection.horizontal,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.wavelength != wavelength ||
        oldDelegate.startFromTop != startFromTop ||
        oldDelegate.direction != direction;
  }
}
