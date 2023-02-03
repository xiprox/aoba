import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/entry_updater_sheet.dart';
import 'package:flutter/material.dart';
import 'package:veee/veee.dart';

import 'data/model/entry_update_data.dart';
import 'entry_updater_vm.dart';

class EntryUpdaterWrapper extends StatelessWidget {
  final int mediaId;
  final MediaType mediaType;
  final String? title;
  final ScoreFormat scoreFormat;
  final int? maxProgress;
  final Color? color;

  final EntryUpdateData data;

  const EntryUpdaterWrapper({
    super.key,
    required this.mediaId,
    required this.mediaType,
    required this.title,
    required this.scoreFormat,
    required this.maxProgress,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EntryUpdaterViewModel>(
      create: (_) => EntryUpdaterViewModel(
        mediaId: mediaId,
        mediaType: mediaType,
        title: title,
        scoreFormat: scoreFormat,
        maxProgress: maxProgress,
        color: color,
        initialFormData: data,
      ),
      child: const EntryUpdaterSheet(),
    );
  }
}
