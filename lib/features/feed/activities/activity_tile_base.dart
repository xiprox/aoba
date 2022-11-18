import 'package:flutter/material.dart';

class ActivityTileBase extends StatelessWidget {
  final Widget child;

  final Function()? onPress;

  const ActivityTileBase({
    super.key,
    required this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
