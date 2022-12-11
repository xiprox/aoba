import 'package:flutter/material.dart';

class Tint extends StatelessWidget {
  final Color color;
  final Widget child;

  const Tint({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Container(color: color),
      ],
    );
  }
}
