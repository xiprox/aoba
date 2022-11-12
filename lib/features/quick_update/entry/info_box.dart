import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final double height;
  final Color color;
  final Widget child;
  final EdgeInsetsGeometry outerPadding;
  final EdgeInsetsGeometry innerPadding;

  const InfoBox({
    super.key,
    this.height = 72,
    required this.color,
    required this.child,
    this.outerPadding = const EdgeInsets.all(8),
    this.innerPadding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
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
