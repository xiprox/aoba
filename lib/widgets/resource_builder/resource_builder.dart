import 'package:aoba/data/model/resource.dart';
import 'package:flutter/material.dart';

import 'defaults/default_empty.dart';
import 'defaults/default_error.dart';
import 'defaults/default_loading.dart';

typedef LoadingBuilder<T> = Widget Function(BuildContext context, T? data);
typedef ContentBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorBuilder<T> = Widget Function(
    BuildContext context, ErrorInfo error, T? data);
typedef EmptyBuilder<T> = Widget Function(BuildContext context);

class ResourceBuilder<T> extends StatelessWidget {
  final Resource<T>? resource;
  final LoadingBuilder<T>? loadingBuilder;
  final ContentBuilder<T> contentBuilder;
  final ErrorBuilder<T>? errorBuilder;
  final EmptyBuilder<T>? emptyBuilder;
  final bool Function(T data)? isEmpty;
  final Function()? onRetry;

  const ResourceBuilder({
    super.key,
    required this.resource,
    this.loadingBuilder,
    required this.contentBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.isEmpty,
    this.onRetry,
    Resource<T>? initialData,
  });

  @override
  Widget build(BuildContext context) {
    if (resource != null) {
      if (resource!.error != null) {
        return _buildError(context, resource!.error!, resource!.data);
      } else if (resource!.isLoading) {
        return _buildLoading(context, resource!.data);
      } else if (resource!.data != null) {
        if (isEmpty?.call(resource!.data as T) == true) {
          return _buildEmpty(context);
        } else {
          return _buildContent(context, resource!.data as T);
        }
      } else {
        return Container();
      }
    }
    return Container();
  }

  Widget _buildLoading(BuildContext context, T? data) {
    final override = loadingBuilder?.call(context, data);
    return override ?? const ResourceBuilderDefaultLoading();
  }

  Widget _buildError(BuildContext context, ErrorInfo error, T? data) {
    final override = errorBuilder?.call(context, error, data);
    return override ??
        ResourceBuilderDefaultError(error: error, onRetry: onRetry);
  }

  Widget _buildEmpty(BuildContext context) {
    final override = emptyBuilder?.call(context);
    return override ?? const ResourceBuilderDefaultEmpty();
  }

  Widget _buildContent(BuildContext context, T data) {
    return contentBuilder(context, data);
  }
}
