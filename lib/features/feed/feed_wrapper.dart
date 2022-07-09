import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'feed_page.dart';
import 'feed_vm.dart';

class FeedWrapper extends StatelessWidget {
  const FeedWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<FeedViewModel>(
      create: (_) => FeedViewModel(),
      child: FeedPage(),
    );
  }
}
