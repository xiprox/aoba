import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String? url;
  final Color? color;
  final Radius radius;
  final double height;
  final ImageType type;
  final Function()? onPress;

  const CoverImage({
    super.key,
    required this.url,
    this.color,
    required this.radius,
    required this.height,
    required this.type,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final shape = SmoothRectangleBorder(borderRadius: BorderRadius.all(radius));
    return Stack(
      children: [
        NetworkImageWithPlaceholder(
          url: url,
          color: color,
          shape: shape,
          height: height,
          type: type,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: shape,
              onTap: onPress,
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}
