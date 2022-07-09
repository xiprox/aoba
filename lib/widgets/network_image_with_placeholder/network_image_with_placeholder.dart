import 'dart:math';

import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/widgets/frame_builders.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

enum ImageType { anime, book, user }

final _kDefaultBorderRadius = BorderRadius.circular(6);

/// Renders [Image.network] if given [url] is not null, otherwise renders
/// a default image with an icon for given [type].
class NetworkImageWithPlaceholder extends StatelessWidget {
  final String? url;
  final ImageType type;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final Function()? onPress;

  const NetworkImageWithPlaceholder({
    Key? key,
    required this.url,
    required this.type,
    this.borderRadius,
    this.width,
    this.height,
    this.color,
    this.onPress,
  }) : super(key: key);

  factory NetworkImageWithPlaceholder.anime(
    String? url, {
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? color,
    Function()? onPress,
  }) {
    return NetworkImageWithPlaceholder(
      url: url,
      type: ImageType.anime,
      borderRadius: borderRadius,
      width: width,
      height: height,
      color: color,
      onPress: onPress,
    );
  }

  factory NetworkImageWithPlaceholder.book(
    String? url, {
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? color,
    Function()? onPress,
  }) {
    return NetworkImageWithPlaceholder(
      url: url,
      type: ImageType.book,
      borderRadius: borderRadius,
      width: width,
      height: height,
      color: color,
      onPress: onPress,
    );
  }

  factory NetworkImageWithPlaceholder.user(
    String? url, {
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? color,
    Function()? onPress,
  }) {
    return NetworkImageWithPlaceholder(
      url: url,
      type: ImageType.user,
      borderRadius: borderRadius,
      width: width,
      height: height,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: borderRadius ?? _kDefaultBorderRadius,
          child: Stack(
            children: [
              _buildPlaceholder(context, constraints),
              if (url != null) _buildImage(context, constraints),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImage(BuildContext context, BoxConstraints constraints) {
    return Image.network(
      url!,
      frameBuilder: FrameBuilder.fadeIn400ms,
      width: width ?? constraints.maxWidth,
      height: height ?? constraints.maxHeight,
      fit: BoxFit.cover,
    );
  }

  Widget _buildPlaceholder(BuildContext context, BoxConstraints constraints) {
    final theme = context.theme;
    final lightTheme = theme.brightness == Brightness.light;
    final backgroundColor =
        color ?? theme.colorScheme.surface.manipulate(lightTheme ? 0.95 : 1.2);

    final width = this.width ?? constraints.maxWidth;
    final height = this.height ?? constraints.maxHeight;
    return Container(
      color: backgroundColor,
      width: width,
      height: height,
      child: Icon(
        _getIcon(),
        color: backgroundColor.manipulate(lightTheme ? 0.85 : 1.5),
        size: min(width, height) * 0.5,
      ),
    );
  }

  IconData _getIcon() {
    switch (type) {
      case ImageType.anime:
        return Icons.movie_rounded;
      case ImageType.book:
        return Icons.bookmark_rounded;
      case ImageType.user:
        return Icons.person_rounded;
      default:
        return Icons.circle;
    }
  }
}
