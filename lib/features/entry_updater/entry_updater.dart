import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/data/model/entry_update_data.dart';
import 'package:aoba/features/entry_updater/entry_updater_wrapper.dart';
import 'package:flutter/material.dart';

class EntryUpdater {
  static Future show(
    BuildContext context, {
    required int mediaId,
    MediaType mediaType = MediaType.$unknown,
    ScoreFormat scoreFormat = ScoreFormat.$unknown,
    String? title,
    int? maxProgress,
    Color? color,
    required EntryUpdateData data,
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: EntryUpdaterWrapper(
            mediaId: mediaId,
            mediaType: mediaType,
            title: title,
            scoreFormat: scoreFormat,
            maxProgress: maxProgress,
            color: color,
            data: data,
          ),
        );
      },
    );
  }
}
