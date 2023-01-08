import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

enum WaveLineDirection { horizontal, vertical }

abstract class WaveLinePath {
  static Path get({
    required double wavelength,
    required double amplitude,
    required double length,
    bool startFromTop = true,
    WaveLineDirection direction = WaveLineDirection.horizontal,
  }) {
    final maxWavesCount = (length / wavelength).floor();
    final optimalWavelength = length / maxWavesCount;
    final halfLength = optimalWavelength / 2;

    double left = 0;
    double top = 0;
    double bottom = amplitude;

    var path = Path();
    path.moveTo(left, startFromTop ? top : bottom);

    var cursor = 0.0;
    var drawingDescend = startFromTop;

    while (cursor < length) {
      final x = cursor + halfLength;
      final y = drawingDescend ? bottom : top;
      final controlX = cursor + halfLength / 2;
      final controlY1 = drawingDescend ? top : bottom;
      final controlY2 = drawingDescend ? bottom : top;

      path.cubicTo(controlX, controlY1, controlX, controlY2, x, y);

      cursor += halfLength;
      drawingDescend = !drawingDescend;
    }

    if (direction == WaveLineDirection.horizontal) {
      // Nothing to do. Default rendering is already horizontal.
    } else if (direction == WaveLineDirection.vertical) {
      // Rotate 90 degrees clockwise and offset by height.
      final matrix = Matrix4.compose(
        Vector3(amplitude, 0, 0),
        Quaternion.fromRotation(Matrix3.rotationZ(radians(90))),
        Vector3(1, 1, 1),
      );
      path = path.transform(matrix.storage);
    }

    return path;
  }
}
