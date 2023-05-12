import 'package:aoba/features/feed/feed_wrapper.dart';
import 'package:aoba/features/quick_update/quick_update_wrapper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          FeedWrapper(),
          Align(
            alignment: Alignment.bottomCenter,
            child: QuickUpdateWrapper(),
          ),
        ],
      ),
    );
  }
}
