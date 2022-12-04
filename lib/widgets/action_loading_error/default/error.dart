import 'package:aoba/exts/build_context_exts.dart';
import 'package:flutter/material.dart';

class ErrorState extends StatelessWidget {
  final String? error;

  const ErrorState({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline_rounded,
      color: context.colors.error,
    );
  }
}
