import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String? username;
  final String? avatarUrl;
  final Color? color;

  final Function()? onPress;

  const User({
    super.key,
    required this.username,
    required this.color,
    required this.avatarUrl,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = color == null
        ? null
        : ColorScheme.fromSeed(
            seedColor: color!,
            brightness: context.theme.brightness,
          );
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            NetworkImageWithPlaceholder(
              key: ValueKey(avatarUrl),
              url: avatarUrl,
              type: ImageType.user,
              width: 24,
              height: 24,
              borderRadius: BorderRadius.circular(40),
            ),
            const SizedBox(width: 8),
            Text(
              username ?? '?',
              style: TextStyle(
                color: colorScheme?.primary ?? context.colors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
