import 'package:flutter/material.dart';

class ListItemWithAction extends StatelessWidget {
  final Widget item;
  final Widget? action;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final Function()? onPress;

  const ListItemWithAction({
    super.key,
    required this.item,
    this.action,
    this.padding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: borderRadius,
      child: SizedBox(
        height: 48,
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Expanded(child: item),
              if (action != null) action!,
            ],
          ),
        ),
      ),
    );
  }
}
