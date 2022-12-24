import 'package:aoba/widgets/painting/paths/wave_path.dart';
import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final Color color;
  final double wavelength;

  const WaveClipper({
    required this.color,
    required this.wavelength,
  });

  @override
  Path getClip(Size size) {
    return WavePath.get(
      length: size.width,
      height: size.height,
      wavelength: wavelength,
    );
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) {
    return color != oldClipper.color || wavelength != oldClipper.wavelength;
  }
}
