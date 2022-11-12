import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  final EdgeInsets padding;
  final Color? color;

  const CommonProgressIndicator({
    super.key,
    this.padding = const EdgeInsets.all(8),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: 32,
        width: 32,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: color == null ? null : AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}
