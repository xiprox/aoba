import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final ImageProvider? image;
  final EdgeInsets imagePadding;
  final Color? color;
  final Function()? onPress;

  const Avatar({
    super.key,
    this.image,
    this.imagePadding = EdgeInsets.zero,
    this.color,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: imagePadding,
          child: CircleAvatar(
            foregroundImage: image,
            backgroundColor: color,
          ),
        ),
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              onTap: onPress,
              borderRadius: BorderRadius.circular(100),
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}
