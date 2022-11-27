import 'package:aoba/widgets/duration/custom_duration_locale.dart';
import 'package:duration/duration.dart';

extension DurationExts on Duration {
  String toAiringCountdown() {
    final moreThanAHundredWeeks = inWeeks >= 100;
    final moreThanAWeek = inWeeks > 1;
    final moreThanADay = inDays > 1;
    final moreThanAnHour = inHours > 1;

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
}
