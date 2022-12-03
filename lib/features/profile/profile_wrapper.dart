import 'package:aoba/data/local/user_info.dart';
import 'package:aoba/services/services.dart';
import 'package:auto_route/annotations.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'profile_vm.dart';

class ProfileWrapper extends StatelessWidget {
  final int? userId;

  const ProfileWrapper({
    super.key,
    @PathParam('id') this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(userId: userId ?? get<UserInfo>().id),
      child: const ProfilePage(),
    );
  }
}
