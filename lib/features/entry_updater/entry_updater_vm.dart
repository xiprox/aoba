import 'package:aoba/arch/show_snack_bar.dart';
import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/data/model/resource.dart';
import 'package:aoba/features/entry_updater/data/entry_updater_repo.dart';
import 'package:aoba/services/services.dart';
import 'package:flutter/material.dart' show Color;
import 'package:veee/veee.dart';

import 'data/model/entry_update_data.dart';

class Close extends ViewModelOrder {}

class EntryUpdaterViewModel extends ViewModel with BusyViewModel {
  final int mediaId;
  final MediaType mediaType;
  final String? title;
  final ScoreFormat scoreFormat;
  final int? maxProgress;
  final Color? color;
  final EntryUpdateData initialFormData;

  EntryUpdaterViewModel({
    required this.mediaId,
    required this.mediaType,
    required this.title,
    required this.scoreFormat,
    required this.maxProgress,
    required this.color,
    required this.initialFormData,
  });

  final _ping = get<PingService>();
  final _repo = get<EntryUpdaterRepo>();

  late var formData = initialFormData;
  ErrorInfo? error;

  bool get changesExist => formData != initialFormData;

  void onStatusChange(MediaListStatus? value) {
    if (value != null) {
      formData = formData.copyWith(status: value);
    }
  }

  void onScoreChange(double value) {
    formData = formData.copyWith(score: value);
  }

  void onProgressChange(int value) {
    formData = formData.copyWith(progress: value);
  }

  void onRepeatsChange(int value) {
    formData = formData.copyWith(repeats: value);
  }

  void onStartedAtChange(DateTime? value) {
    formData = formData.copyWith(startedAt: value);
  }

  void onCompletedAtChange(DateTime? value) {
    formData = formData.copyWith(completedAt: value);
  }

  void onNotesChange(String value) {
    formData = formData.copyWith(notes: value);
  }

  void onSavePress() async {
    setBusy(true);

    final result = await _repo.updateEntry(mediaId: mediaId, data: formData);

    if (result.error != null) {
      error = result.error;
      setBusy(false);
      if (error?.message != null) order(ShowSnackBar(error!.message!));
    } else {
      setBusy(false);
      order(Close());
      _ping.notify(PingType.mediaListEntryUpdated);
    }
  }
}
