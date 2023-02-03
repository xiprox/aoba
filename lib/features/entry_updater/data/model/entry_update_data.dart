import 'package:aoba/data/model/aliases.dart';

class EntryUpdateData {
  final MediaListStatus? status;
  final double? score;
  final int? progress;
  final int? progressVolumes;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int? repeats;
  final String? notes;

  const EntryUpdateData({
    this.status,
    this.score,
    this.progress,
    this.progressVolumes,
    this.startedAt,
    this.completedAt,
    this.repeats,
    this.notes,
  });

  EntryUpdateData copyWith({
    MediaListStatus? status,
    double? score,
    int? progress,
    int? progressVolumes,
    DateTime? startedAt,
    DateTime? completedAt,
    int? repeats,
    String? notes,
  }) {
    return EntryUpdateData(
      status: status ?? this.status,
      score: score ?? this.score,
      progress: progress ?? this.progress,
      progressVolumes: progressVolumes ?? this.progressVolumes,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      repeats: repeats ?? this.repeats,
      notes: notes ?? this.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EntryUpdateData &&
        other.status == status &&
        other.score == score &&
        other.progress == progress &&
        other.progressVolumes == progressVolumes &&
        other.startedAt == startedAt &&
        other.completedAt == completedAt &&
        other.repeats == repeats &&
        other.notes == notes;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      score.hashCode ^
      progress.hashCode ^
      progressVolumes.hashCode ^
      startedAt.hashCode ^
      completedAt.hashCode ^
      repeats.hashCode ^
      notes.hashCode;
}
