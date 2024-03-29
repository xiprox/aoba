import 'package:aoba/widgets/duration/custom_duration_locale.dart';
import 'package:duration/duration.dart';

extension DurationExts on Duration {
  String toAiringCountdown() {
    final seconds = inSeconds;
    final minutes = seconds / 60;
    final hours = minutes / 60;
    final days = hours / 24;
    final weeks = days / 7;
    final moreThanAHundredWeeks = weeks >= 100;
    final moreThanAWeek = weeks > 1;
    final moreThanADay = days > 1;
    final moreThanAnHour = hours > 1;

    DurationTersity tersity;
    if (moreThanAHundredWeeks) {
      tersity = DurationTersity.week;
    } else if (moreThanAWeek) {
      tersity = DurationTersity.day;
    } else if (moreThanADay) {
      tersity = DurationTersity.hour;
    } else if (moreThanAnHour) {
      tersity = DurationTersity.minute;
    } else {
      tersity = DurationTersity.second;
    }

    return prettyDuration(
      this,
      abbreviated: true,
      delimiter: ' ',
      spacer: '',
      tersity: tersity,
      locale: const CustomDurationLocale(),
    );
  }

  String toMediaDuration() {
    return prettyDuration(
      this,
      abbreviated: true,
      delimiter: ' ',
      spacer: '',
      tersity: DurationTersity.minute,
      locale: const CustomDurationLocale(),
    );
  }

  /// In what period intervals should a countdown for this duration be
  /// refreshed.
  Duration refreshPeriod() {
    if (inMinutes < 1) {
      return const Duration(seconds: 1);
    } else if (inHours < 1) {
      return const Duration(minutes: 1);
    } else if (inDays < 1) {
      return const Duration(minutes: 20);
    } else {
      return const Duration(days: 1000);
    }
  }
}
