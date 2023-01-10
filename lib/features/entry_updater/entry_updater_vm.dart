import 'package:aoba/data/model/aliases.dart';
import 'package:flutter/material.dart' show Color;
import 'package:veee/veee.dart';

class EntryUpdaterViewModel extends ViewModel {
  final MediaType mediaType;
  final String? title;
  final String? bannerImage;
  final MediaListStatus? status;
  final ScoreFormat scoreFormat;
  final double? score;
  final int? progress;
  final int? maxPossibleProgress;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int? repeats;
  final String? notes;

  final Color? color;

  EntryUpdaterViewModel({
    required this.mediaType,
    required this.title,
    required this.bannerImage,
    required this.status,
    required this.scoreFormat,
    required this.score,
    required this.progress,
    required this.maxPossibleProgress,
    required this.startedAt,
    required this.completedAt,
    required this.notes,
    required this.repeats,
    required this.color,
  });

  void onSavePress() {}
}
