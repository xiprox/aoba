import 'package:flutter/painting.dart';

abstract class WavePath {
  static Path get({
    required double width,
    required double height,
    required double wavelength,
  }) {
    final halfLength = wavelength / 2;

    var path = Path();
    var x = 0.0;
    var startFromTop = false;
    while (x < width) {
      if (startFromTop) {
        path.lineTo(x, height);
        path.cubicTo(
          x + halfLength / 2,
          height,
          x + halfLength / 2,
          0,
          x + halfLength,
          0,
        );
      } else {
        path.lineTo(x, 0);
        path.cubicTo(
          x + halfLength / 2,
          0,
          x + halfLength / 2,
          height,
          x + halfLength,
          height,
        );
      }
      x += halfLength;
      startFromTop = !startFromTop;
    }

    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }
}
