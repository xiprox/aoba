import 'package:aoba/data/model/aliases.dart';
import 'package:flutter/material.dart';

import 'fields/label.dart';
import 'fields/progress.dart';
import 'fields/repeats.dart';
import 'fields/score.dart';
import 'fields/status.dart';

class EntryUpdateForm extends StatelessWidget {
  final MediaType mediaType;
  final MediaListStatus? initialStatus;
  final ScoreFormat scoreFormat;
  final double? initialScore;
  final int? initialProgress;
  final int? maxPossibleProgress;
  final DateTime? initialStartDate;
  final DateTime? initialCompleteDate;
  final int? initialRepeats;
  final String? initialNotes;

  const EntryUpdateForm({
    super.key,
    required this.mediaType,
    this.initialStatus,
    required this.scoreFormat,
    this.initialScore,
    this.initialProgress,
    this.maxPossibleProgress,
    this.initialStartDate,
    this.initialCompleteDate,
    this.initialRepeats,
    this.initialNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label('Status'),
          const SizedBox(height: 8),
          StatusField(
            mediaType: mediaType,
            initialValue: initialStatus,
          ),
          const SizedBox(height: 16),
          const Label('Score'),
          const SizedBox(height: 8),
          ScoreField(
            scoreFormat: scoreFormat,
            initialValue: initialScore,
          ),
          const SizedBox(height: 16),
          Label(
            mediaType == MediaType.ANIME
                ? 'Episode Progress'
                : 'Chapter Progress',
          ),
          const SizedBox(height: 8),
          ProgressField(
            initialValue: initialProgress,
            max: maxPossibleProgress,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Label('Start Date'),
                    const SizedBox(height: 8),
                    InputDatePickerFormField(
                      fieldLabelText: '',
                      firstDate: DateTime(1669, 1, 1),
                      lastDate: DateTime(2069, 1, 1),
                      initialDate: initialStartDate,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Label('Finish Date'),
                    const SizedBox(height: 8),
                    InputDatePickerFormField(
                      fieldLabelText: '',
                      firstDate: DateTime(1669, 1, 1),
                      lastDate: DateTime(2069, 1, 1),
                      initialDate: initialCompleteDate,
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
            initialValue: initialRepeats,
          ),
          const SizedBox(height: 16),
          const Label('Notes'),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: initialNotes,
            maxLines: 5,
            minLines: 1,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
