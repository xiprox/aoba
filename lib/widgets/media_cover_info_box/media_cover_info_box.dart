import 'package:flutter/material.dart';

class MediaCoverInfoBox extends StatelessWidget {
  final Color color;
  final Widget child;
  final double? height;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry outerPadding;
  final EdgeInsetsGeometry innerPadding;

  const MediaCoverInfoBox({
    super.key,
    required this.color,
    required this.child,
    this.height,
    this.alignment = Alignment.bottomCenter,
    this.outerPadding = const EdgeInsets.all(8),
    this.innerPadding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        height: height,
        child: Padding(
          padding: outerPadding,
          child: Material(
            color: color,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: innerPadding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
