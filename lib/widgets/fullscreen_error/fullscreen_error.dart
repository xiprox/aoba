import 'package:aoba/consts/consts.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/material_exts.dart';
import 'package:aoba/widgets/tint/tint.dart';
import 'package:flutter/material.dart';

class FullscreenError extends StatelessWidget {
  final ErrorInfo error;

  const FullscreenError({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/notlikethis.jpg',
              width: 100,
              height: 100,
              color: colors.error.manipulate(1).withOpacity(0.8),
              colorBlendMode: BlendMode.color,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'あの。。。',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: colors.error,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.message ?? kDefaultUnknownErrorText,
            style: TextStyle(color: colors.onBackground),
          ),
        ],
      ),
    );
  }
}
