import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final Color background;
  final Color foreground;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final Function()? onPress;

  const FlatButton({
    super.key,
    required this.background,
    required this.foreground,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: background,
      child: InkWell(
        onTap: onPress,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: DefaultTextStyle.merge(
            style: TextStyle(color: foreground),
            child: child,
          ),
        ),
      ),
    );
  }
}
