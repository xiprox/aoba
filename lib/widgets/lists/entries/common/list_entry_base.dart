import 'package:aoba/data/model/aliases.dart';
import 'package:flutter/material.dart';

class ListEntryBase extends StatelessWidget {
  final String title;
  final String? coverUrl;
  final Color? color;
  final MediaType type;
  final MediaFormat format;
  final MediaStatus mediaStatus;
  final MediaListStatus status;
  final int? duration;
  final int progress;
  final int total;
  final ScoreFormat? scoreFormat;
  final double? score;

  final Function()? onPress;
  final Function()? onEditPress;

  const ListEntryBase({
    super.key,
    required this.title,
    this.coverUrl,
    this.color,
    required this.type,
    required this.format,
    required this.mediaStatus,
    required this.status,
    required this.duration,
    required this.progress,
    required this.total,
    this.scoreFormat,
    this.score,
    this.onPress,
    this.onEditPress,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
