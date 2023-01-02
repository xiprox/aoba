import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/widgets/avatar/avatar.dart';
import 'package:aoba/widgets/smooth_rectangle_border/smooth_rectangle_border.dart';
import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String? avatarUrl;
  final String? name;
  final double scrollProgress;

  const InfoBox({
    super.key,
    this.avatarUrl,
    this.name,
    required this.scrollProgress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = context.theme;
    final progress = Curves.ease.transform(1 - scrollProgress);
    return Material(
      shape: const SmoothRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(Radius.circular(12)),
      ),
      color: colors.secondaryContainer.withOpacity(1 - scrollProgress),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BackButton(
                color: colors.onSecondaryContainer,
              ),
              const SizedBox(width: 4),
              Opacity(
                opacity: progress,
                child: Avatar(
                  image: avatarUrl,
                  size: Tween(begin: 48.0, end: 0.0).transform(1 - progress),
                  color: colors.secondaryContainer.manipulate(0.8),
                  zoom: 1 + (1 - progress),
                ),
              ),
              SizedBox(
                width: Tween<double>(
                  begin: 16,
                  end: 4,
                ).transform(scrollProgress),
              ),
              Text(
                name ?? '',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colors.onSecondaryContainer,
                ),
              ),
              SizedBox(width: name == null ? 0 : 8),
            ],
          ),
        ),
      ),
    );
  }
}
