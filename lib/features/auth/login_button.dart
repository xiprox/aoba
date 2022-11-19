import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onPress;

  const LoginButton({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = colors.primary;
    final borderRadius = BorderRadius.circular(8);
    return InkWell(
      overlayColor: MaterialStateProperty.all(color.withOpacity(0.2)),
      borderRadius: borderRadius,
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign In with AniList',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_right_alt_rounded,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
