import 'package:aoba/widgets/painting/paths/wave_path.dart';
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color color;
  final double wavelength;

  const WavePainter({
    this.color = Colors.black,
    this.wavelength = 24 * 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = WavePath.get(
      width: size.width,
      height: size.height,
      wavelength: wavelength,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.wavelength != wavelength;
  }
}
