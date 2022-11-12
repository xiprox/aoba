import 'package:aoba/widgets/common_progress_indicator/common_progress_indicator.dart';
import 'package:flutter/material.dart';

class ResourceBuilderDefaultLoading extends StatelessWidget {
  const ResourceBuilderDefaultLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: ValueKey('resource_stream_builder_loading'),
      child: CommonProgressIndicator(),
    );
  }
}
