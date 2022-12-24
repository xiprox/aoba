import 'package:aoba/widgets/painting/paths/wave_path.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color color;
  final double wavelength;
  final bool? startFromTop;
  final WaveDirection? direction;

  const WavePainter({
    required this.color,
    this.wavelength = 24 * 2,
    this.startFromTop,
    this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = WavePath.get(
      length: size.width,
      height: size.height,
      wavelength: wavelength,
      startFromTop: startFromTop == true,
      direction: direction ?? WaveDirection.horizontal,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.wavelength != wavelength;
  }
}
