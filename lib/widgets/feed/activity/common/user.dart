import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/avatar/avatar.dart';
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
    final colors = color == null
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
            Avatar(
              key: ValueKey(avatarUrl),
              image: avatarUrl,
              size: 24,
              color: colors?.surfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              username ?? '?',
              style: TextStyle(
                color: colors?.primary ?? context.colors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
