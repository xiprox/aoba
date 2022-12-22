import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'user_box.dart';
import 'user_box_vm.dart';

class UserBoxWrapper extends StatelessWidget {
  final Function()? onPress;

  const UserBoxWrapper({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: (_) => UserBoxViewModel(),
      child: UserBox(onPress: onPress),
    );
  }
}
