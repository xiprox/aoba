import 'package:aoba/data/model/aliases.dart';

extension DateTimeExts on DateTime {
  FuzzyDateInput toFuzzyDateInput() {
    return FuzzyDateInput(year: year, month: month, day: day);
  }
}
