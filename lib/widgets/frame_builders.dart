import 'dart:ui';

import 'package:flutter/material.dart';

/// Container class that houses [Image] frame builders.
class FrameBuilder {
  static Widget fadeIn(
    BuildContext context,
    Widget child,
    int frame,
    bool wasSynchronouslyLoaded,
  ) {
    return _fadeIn(
      context,
      child,
      frame,
      wasSynchronouslyLoaded,
      const Duration(milliseconds: 500),
    );
  }

  static Widget fadeIn200ms(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return _fadeIn(
      context,
      child,
      frame,
      wasSynchronouslyLoaded,
      const Duration(milliseconds: 200),
    );
  }

  static Widget fadeIn400ms(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    return _fadeIn(
      context,
      child,
      frame,
      wasSynchronouslyLoaded,
      const Duration(milliseconds: 400),
    );
  }

  static Widget _fadeIn(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
    Duration duration,
  ) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedOpacity(
      opacity: frame == null ? 0 : 1,
      duration: duration,
      curve: Curves.easeOut,
      child: child,
    );
  }

  static Widget blurredPlaceholder(
    BuildContext context,
    Widget child,
    int frame,
    bool wasSynchronouslyLoaded,
    Image placeholder,
  ) {
    if (wasSynchronouslyLoaded) return child;
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: placeholder,
    );
  }
}
