import 'package:aoba/services/services.dart';
import 'package:auto_route/annotations.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'lists_page.dart';
import 'lists_vm.dart';

@RoutePage()
class ListsWrapper extends StatelessWidget {
  final int? userId;
  final Color? color;

  const ListsWrapper({
    super.key,
    @pathParam this.userId,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ListsViewModel>(
      create: (_) {
        final userInfo = get<Database>().userInfo;
        return ListsViewModel(
          userId: userId ?? userInfo.id,
          color: color,
        );
      },
      child: const ListsPage(),
    );
  }
}
