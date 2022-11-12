import 'package:flutter/material.dart';

class ResourceBuilderDefaultEmpty extends StatelessWidget {
  const ResourceBuilderDefaultEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: ValueKey('resource_stream_builder_empty'),
      child: Center(child: Text('Nothing')),
    );
  }
}
