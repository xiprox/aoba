import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'avatar.dart';
import 'avatar_vm.dart';

class AvatarWrapper extends StatelessWidget {
  const AvatarWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: (_) => AvatarViewModel(),
      child: const Avatar(),
    );
  }
}
