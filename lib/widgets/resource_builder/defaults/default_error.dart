import 'package:aoba/consts/consts.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:flutter/material.dart';

class ResourceBuilderDefaultError extends StatelessWidget {
  final ErrorInfo error;
  final Function()? onRetry;

  const ResourceBuilderDefaultError({
    Key? key,
    required this.error,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey('resource_stream_builder_error'),
      child: Center(
        child: Text(error.message ?? kDefaultUnknownErrorText),
      ),
    );
  }
}
