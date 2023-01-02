import 'dart:ui';

import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/exts/string_exts.dart';
import 'package:aoba/mixins/snackbar_mixin.dart';
import 'package:aoba/navigation/navigation.dart';
import 'package:aoba/utils/anilist_utils.dart';
import 'package:aoba/widgets/avatar/avatar.dart';
import 'package:aoba/widgets/popup_on_position/route.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'popup_content.dart';
import 'user_box_vm.dart';

class UserBox extends ViewModelWidget<UserBoxViewModel>
    with SnackBarMixin, SnackBarInViewModelWidgetMixin {
  final Function()? onPress;

  const UserBox({super.key, this.onPress});

  @override
  void handleOrder(
    BuildContext context,
    ViewModelOrder order,
    UserBoxViewModel vm,
  ) {
    super.handleOrder(context, order, vm);
    if (order is OpenProfile) {
      context.router.navigate(
        ProfileRoute(userId: vm.userId, color: vm.color?.fromAniListColor()),
      );
    }
    if (order is ClosePopup) {
      context.router.pop();
    }
  }

  void _onPress(BuildContext context, UserBoxViewModel vm) {
    final windowPadding = window.padding;
    final position = context.findPosition();
    final movedPosition = position.translate(
      position.dx,
      position.dy + 48 - windowPadding.top,
    );
    context.router.pushNativeRoute(PopupOnPositionRoute(
      position: movedPosition,
      child: UserBoxPopupContent(
        username: vm.name ?? '?',
        onProfilePress: vm.onProfilePress,
        onSettingsPress: vm.onSettingsPress,
        onLogoutPress: vm.onLogoutPress,
      ),
    ));
  }

  @override
  Widget build(BuildContext context, UserBoxViewModel vm) {
    final color = AniListUtils().colorFromProfileColor(vm.color);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Avatar(
        image: vm.avatarMedium,
        imagePadding: const EdgeInsets.all(4),
        color: color,
        onPress: () => _onPress(context, vm),
      ),
    );
  }
}
