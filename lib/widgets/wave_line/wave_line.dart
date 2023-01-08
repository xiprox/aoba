import 'package:aoba/widgets/painting/painters/wave_line_painter.dart';
import 'package:aoba/widgets/painting/paths/wave_line_path.dart';
import 'package:flutter/material.dart';

class WaveLine extends StatelessWidget {
  final Color color;
  final double? strokeWidth;
  final double height;
  final double wavelength;
  final bool? startFromTop;
  final WaveLineDirection? direction;

  const WaveLine({
    super.key,
    required this.color,
    this.strokeWidth,
    required this.height,
    required this.wavelength,
    this.startFromTop,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationX(0),
      child: CustomPaint(
        painter: WaveLinePainter(
          color: color,
          wavelength: wavelength,
          strokeWidth: strokeWidth,
          startFromTop: startFromTop,
          direction: direction,
        ),
        size: Size(double.infinity, height),
      ),
    );
  }
}
