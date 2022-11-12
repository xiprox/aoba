import 'dart:math';

import 'package:flutter/material.dart';

class Handle extends StatelessWidget {
  final bool expanded;
  final Function()? onPress;

  const Handle({
    super.key,
    required this.expanded,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Quick Update',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: expanded
                ? Tween(begin: 0.0, end: 1.0)
                : Tween(begin: 1.0, end: 0.0),
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: const Icon(Icons.keyboard_arrow_up_rounded),
            builder: (context, value, child) {
              return Transform.rotate(
                angle: pi * value,
                child: child,
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
