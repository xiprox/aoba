import 'package:aoba/widgets/painting/paths/wave_path.dart';
import 'package:flutter/material.dart';

class Wave {
  final double amplitude;
  final double wavelength;
  final bool startFromTop;

  const Wave({
    required this.amplitude,
    required this.wavelength,
    this.startFromTop = true,
  });

  Wave scale(double t) {
    return Wave(amplitude: amplitude * t, wavelength: wavelength * t);
  }
}

class WaveSide {
  final Wave? left;
  final Wave? top;
  final Wave? right;
  final Wave? bottom;

  const WaveSide.all(Wave wave)
      : this.only(left: wave, top: wave, right: wave, bottom: wave);

  const WaveSide.vertical(Wave? wave) : this.only(top: wave, bottom: wave);

  const WaveSide.horizontal(Wave? wave) : this.only(left: wave, right: wave);

  const WaveSide.only({this.left, this.top, this.right, this.bottom});

  WaveSide scale(double t) {
    return WaveSide.only(
      left: left?.scale(t),
      top: top?.scale(t),
      right: right?.scale(t),
      bottom: bottom?.scale(t),
    );
  }
}

class WaveBorder extends ShapeBorder {
  final BorderRadiusGeometry borderRadius;
  final WaveSide side;

  const WaveBorder({
    required this.side,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getPath(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getPath(borderRadius.resolve(textDirection).toRRect(rect));
  }

  Path getPath(RRect parent) {
    final width = parent.width;
    final height = parent.height;
    final top = parent.top;
    final left = parent.left;
    final bottom = parent.bottom;
    final right = parent.right;

    final sideLeft = side.left;
    final sideTop = side.top;
    final sideRight = side.right;
    final sideBottom = side.bottom;

    final topAmplitude = sideTop?.amplitude ?? 0;
    final bottomAmplitude = sideBottom?.amplitude ?? 0;

    final fillRect = Rect.fromLTRB(
      left + (sideLeft?.amplitude ?? 0),
      top + topAmplitude,
      right - (sideRight?.amplitude ?? 0),
      bottom - bottomAmplitude,
    );

    final horizontalLength = width;
    final verticalLength = height - bottomAmplitude;

    var path = Path()..addRect(fillRect);

    if (sideLeft != null) {
      final wave = WavePath.get(
        length: verticalLength,
        height: sideLeft.amplitude,
        wavelength: sideLeft.wavelength,
        startFromTop: sideLeft.startFromTop,
        direction: WaveDirection.verticalFlipped,
      );
      path.addPath(wave, Offset(left, top));
    }

    if (sideTop != null) {
      final wave = WavePath.get(
        length: horizontalLength,
        height: sideTop.amplitude,
        wavelength: sideTop.wavelength,
        startFromTop: sideTop.startFromTop,
        direction: WaveDirection.horizontal,
      );
      path.addPath(wave, Offset(left, top));
    }

    if (sideRight != null) {
      final wave = WavePath.get(
        length: verticalLength,
        height: sideRight.amplitude,
        wavelength: sideRight.wavelength,
        startFromTop: sideRight.startFromTop,
        direction: WaveDirection.vertical,
      );
      path.addPath(wave, Offset(fillRect.right, top));
    }

    if (sideBottom != null) {
      final wave = WavePath.get(
        length: horizontalLength,
        height: sideBottom.amplitude,
        wavelength: sideBottom.wavelength,
        startFromTop: sideBottom.startFromTop,
        direction: WaveDirection.horizontalFlipped,
      );
      path.addPath(wave, Offset(left, fillRect.bottom));
    }

    path.close();

    return Path.combine(
      PathOperation.intersect,
      path,
      Path()..addRRect(parent),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return WaveBorder(
      borderRadius: borderRadius,
      side: side.scale(t),
    );
  }

  WaveBorder copyWith({
    WaveSide? side,
    BorderRadiusGeometry? borderRadius,
  }) {
    return WaveBorder(
      borderRadius: borderRadius ?? this.borderRadius,
      side: side ?? this.side,
    );
  }

  @override
  int get hashCode {
    return borderRadius.hashCode ^ side.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is WaveBorder &&
        other.borderRadius == borderRadius &&
        other.side == side;
  }
}
