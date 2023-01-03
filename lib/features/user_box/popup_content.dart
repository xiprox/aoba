import 'package:aoba/exts/build_context_exts.dart';
import 'package:aoba/widgets/list_item_with_action/list_item_with_action.dart';
import 'package:aoba/widgets/popup_on_position/popup_on_position_container.dart';
import 'package:flutter/material.dart';

class UserBoxPopupContent extends StatelessWidget {
  final String username;
  final Function()? onProfilePress;
  final Function()? onSettingsPress;
  final Function()? onLogoutPress;

  const UserBoxPopupContent({
    super.key,
    required this.username,
    this.onProfilePress,
    this.onSettingsPress,
    this.onLogoutPress,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PopupOnPositionContainer(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListItemWithAction(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              item: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  color: colors.onSurface,
                ),
              ),
              action: IconButton(
                icon: const Icon(Icons.logout_rounded),
                color: colors.tertiary,
                onPressed: onLogoutPress,
              ),
              onPress: onProfilePress,
            ),
            const Divider(),
            ListItemWithAction(
              item: Text(
                'Settings',
                style: TextStyle(color: colors.onSurface, fontSize: 16),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              onPress: onSettingsPress,
            ),
          ],
        ),
      ),
    );
  }
}
