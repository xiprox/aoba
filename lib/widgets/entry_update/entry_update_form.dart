import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/features/entry_updater/data/model/entry_update_data.dart';
import 'package:aoba/widgets/input/date_input_field/date_input_form_field.dart';
import 'package:flutter/material.dart';

import 'fields/label.dart';
import 'fields/progress.dart';
import 'fields/repeats.dart';
import 'fields/score.dart';
import 'fields/status.dart';

class EntryUpdateForm extends StatelessWidget {
  final bool enabled;
  final MediaType mediaType;
  final ScoreFormat scoreFormat;
  final int? maxProgress;
  final EntryUpdateData initialData;
  final ValueChanged<MediaListStatus?>? onStatusChange;
  final ValueChanged<double>? onScoreChange;
  final ValueChanged<int>? onProgressChange;
  final ValueChanged<int>? onRepeatsChange;
  final ValueChanged<DateTime?>? onStartedAtChange;
  final ValueChanged<DateTime?>? onCompletedAtChange;
  final ValueChanged<String>? onNotesChange;

  const EntryUpdateForm({
    super.key,
    this.enabled = true,
    required this.mediaType,
    required this.scoreFormat,
    this.maxProgress,
    required this.initialData,
    this.onStatusChange,
    this.onScoreChange,
    this.onProgressChange,
    this.onRepeatsChange,
    this.onStartedAtChange,
    this.onCompletedAtChange,
    this.onNotesChange,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Opacity(
        opacity: enabled ? 1 : 0.6,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Label('Status'),
              const SizedBox(height: 8),
              StatusField(
                mediaType: mediaType,
                initialValue: initialData.status,
                onChange: onStatusChange,
              ),
              const SizedBox(height: 16),
              const Label('Score'),
              const SizedBox(height: 8),
              ScoreField(
                scoreFormat: scoreFormat,
                initialValue: initialData.score,
                onChange: onScoreChange,
              ),
              const SizedBox(height: 16),
              Label(
                mediaType == MediaType.ANIME
                    ? 'Episode Progress'
                    : 'Chapter Progress',
              ),
              const SizedBox(height: 8),
              ProgressField(
                initialValue: initialData.progress,
                max: maxProgress,
                onChange: onProgressChange,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Label('Start Date'),
                        const SizedBox(height: 8),
                        DateInputFormField(
                          initialValue: initialData.startedAt,
                          expanded: true,
                          onChange: onStartedAtChange,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Label('Finish Date'),
                        const SizedBox(height: 8),
                        DateInputFormField(
                          initialValue: initialData.completedAt,
                          expanded: true,
                          onChange: onCompletedAtChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Label(
                mediaType == MediaType.ANIME
                    ? 'Total Re-watches'
                    : 'Total Re-reads',
              ),
              const SizedBox(height: 8),
              RepeatsField(
                initialValue: initialData.repeats,
                onChange: onRepeatsChange,
              ),
              const SizedBox(height: 16),
              const Label('Notes'),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: initialData.notes,
                maxLines: 10,
                minLines: 1,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                onChanged: onNotesChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
