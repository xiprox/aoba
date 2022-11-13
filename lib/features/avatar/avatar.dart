import 'package:aoba/utils/anilist_utils.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'avatar_vm.dart';

class Avatar extends ViewModelWidget<AvatarViewModel> {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context, AvatarViewModel vm) {
    final color = AniListUtils().colorFromProfileColor(vm.color);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: CircleAvatar(
              foregroundImage: NetworkImage(vm.avatarMedium ?? ''),
              backgroundColor: color,
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
