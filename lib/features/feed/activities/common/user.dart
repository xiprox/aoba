import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/utils/anilist_utils.dart';
import 'package:aoba/widgets/network_image_with_placeholder/network_image_with_placeholder.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String? username;
  final String? profileColor;
  final String? avatarUrl;

  final Function()? onPress;

  const User({
    super.key,
    required this.username,
    required this.profileColor,
    required this.avatarUrl,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final userColor = AniListUtils().colorFromProfileColor(profileColor);
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
                color: userColor?.harmonize(colors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
