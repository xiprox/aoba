import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class OptionsAction extends StatelessWidget {
  final Function(Offset position) onPress;

  const OptionsAction({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQ = context.media;
    return Builder(
      builder: (context) {
        return IconButton(
          onPressed: () {
            final box = context.findRenderBox();
            final position = box.localToGlobal(Offset.zero);
            final width = box.size.width;
            final height = box.size.height;
            final center = position.translate(
              width / 4,
              height / 4 - mediaQ.padding.top,
            );
            onPress(center);
          },
          icon: const Icon(Icons.tune_rounded),
        );
      },
    );
  }
}
