import 'package:aoba/data/model/aliases.dart';
import 'package:aoba/widgets/input/date_input_field/date_input_form_field.dart';
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
        mainAxisSize: MainAxisSize.min,
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Label('Start Date'),
                    const SizedBox(height: 8),
                    DateInputFormField(
                      initialValue: initialStartDate,
                      expanded: true,
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
                      initialValue: initialCompleteDate,
                      expanded: true,
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
            maxLines: 10,
            minLines: 1,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
