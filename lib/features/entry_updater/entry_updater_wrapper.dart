import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/entry_updater_sheet.dart';
import 'package:veee/veee.dart';
import 'package:flutter/material.dart';

import 'entry_updater_vm.dart';

class EntryUpdaterWrapper extends StatelessWidget {
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

  const EntryUpdaterWrapper({
    super.key,
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
    required this.repeats,
    required this.notes,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EntryUpdaterViewModel>(
      create: (_) => EntryUpdaterViewModel(
        mediaType: mediaType,
        title: title,
        bannerImage: bannerImage,
        status: status,
        scoreFormat: scoreFormat,
        score: score,
        progress: progress,
        maxPossibleProgress: maxPossibleProgress,
        startedAt: startedAt,
        completedAt: completedAt,
        notes: notes,
        repeats: repeats,
        color: color,
      ),
      child: const EntryUpdaterSheet(),
    );
  }
}
