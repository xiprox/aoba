import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'avatar.dart';
import 'avatar_vm.dart';

class AvatarWrapper extends StatelessWidget {
  final Function()? onPress;

  const AvatarWrapper({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: (_) => AvatarViewModel(),
      child: Avatar(onPress: onPress),
    );
  }
}
