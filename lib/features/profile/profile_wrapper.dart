import 'package:aoba/services/services.dart';
import 'package:auto_route/annotations.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';
import 'profile_vm.dart';

@RoutePage()
class ProfileWrapper extends StatelessWidget {
  final int? userId;
  final Color? color;

  const ProfileWrapper({
    super.key,
    @PathParam('id') this.userId,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(
        userId: userId ?? get<Database>().userInfo.id,
        color: color,
      ),
      child: const ProfilePage(),
    );
  }
}
