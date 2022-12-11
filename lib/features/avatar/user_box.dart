import 'package:aoba/utils/anilist_utils.dart';
import 'package:aoba/widgets/avatar/avatar.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'user_box_vm.dart';

class UserBox extends ViewModelWidget<UserBoxViewModel> {
  final Function()? onPress;

  const UserBox({super.key, this.onPress});

  @override
  Widget build(BuildContext context, UserBoxViewModel vm) {
    final color = AniListUtils().colorFromProfileColor(vm.color);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Avatar(
        image: NetworkImage(vm.avatarMedium ?? ''),
        imagePadding: const EdgeInsets.all(4),
        color: color,
        onPress: onPress,
      ),
    );
  }
}
