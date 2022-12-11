import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? image;
  final EdgeInsets imagePadding;
  final Color? color;
  final double size;
  final double zoom;
  final Function()? onPress;

  const Avatar({
    super.key,
    this.image,
    this.imagePadding = EdgeInsets.zero,
    this.color,
    this.size = 40,
    this.zoom = 1,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final zoomedSize = size * zoom;
    return Stack(
      children: [
        Padding(
          padding: imagePadding,
          child: SizedBox(
            width: size,
            height: size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(zoomedSize / 2),
              child: FittedBox(
                fit: BoxFit.none,
                alignment: Alignment.center,
                child: Container(
                  color: color,
                  child: NetworkImageWithPlaceholder(
                    url: image,
                    type: ImageType.user,
                    color: color,
                    width: zoomedSize,
                    height: zoomedSize,
                  ),
                ),
              ),
            ),
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
