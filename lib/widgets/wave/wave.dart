import 'package:aoba/widgets/painting/painters/wave_painter.dart';
import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  final Color color;
  final double height;
  final double wavelength;

  const Wave({
    super.key,
    required this.color,
    required this.height,
    required this.wavelength,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(0),
      child: CustomPaint(
        painter: WavePainter(
          color: color,
          wavelength: wavelength,
        ),
        size: Size(double.infinity, height),
      ),
    );
  }
}
