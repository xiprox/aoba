import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

enum WaveDirection {
  horizontal,
  vertical,
  horizontalFlipped,
  verticalFlipped,
}

abstract class WavePath {
  static Path get({
    required double wavelength,
    required double length,
    required double height,
    bool startFromTop = true,
    WaveDirection direction = WaveDirection.horizontal,
  }) {
    final maxWavesCount = (length / wavelength).floor();
    final optimalWavelength = length / maxWavesCount;
    final halfLength = optimalWavelength / 2;

    double left = 0;
    double top = 0;
    double right = length;
    double bottom = height;

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

    path.lineTo(right, bottom);
    path.lineTo(left, bottom);

    if (direction == WaveDirection.horizontal) {
      // Nothing to do. Default rendering is already horizontal.
    } else if (direction == WaveDirection.horizontalFlipped) {
      // Flip vertically and offset by height.
      final matrix = Matrix4.compose(
        Vector3(0, height, 0),
        Quaternion.fromRotation(Matrix3.rotationX(radians(180))),
        Vector3(1, 1, 1),
      );
      path = path.transform(matrix.storage);
    } else if (direction == WaveDirection.vertical) {
      // Rotate 90 degrees clockwise and offset by height.
      final matrix = Matrix4.compose(
        Vector3(height, 0, 0),
        Quaternion.fromRotation(Matrix3.rotationZ(radians(90))),
        Vector3(1, 1, 1),
      );
      path = path.transform(matrix.storage);
    } else if (direction == WaveDirection.verticalFlipped) {
      // Rotate 90 degrees counter-clockwise and offset by width.
      final matrix = Matrix4.compose(
        Vector3(0, length, 0),
        Quaternion.fromRotation(Matrix3.rotationZ(radians(-90))),
        Vector3(1, 1, 1),
      );
      path = path.transform(matrix.storage);
    }

    path.close();

    return path;
  }
}
