import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/entry_updater_wrapper.dart';
import 'package:flutter/material.dart';

class EntryUpdater {
  static Future show(
    BuildContext context, {
    MediaType mediaType = MediaType.$unknown,
    String? title,
    String? bannerImage,
    MediaListStatus? status,
    ScoreFormat scoreFormat = ScoreFormat.$unknown,
    double? score,
    int? progress,
    int? maxPossibleProgress,
    DateTime? startedAt,
    DateTime? completedAt,
    int? repeats,
    String? notes,
    Color? color,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (context) {
        return EntryUpdaterWrapper(
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
          repeats: repeats,
          notes: notes,
          color: color,
        );
      },
    );
  }
}
