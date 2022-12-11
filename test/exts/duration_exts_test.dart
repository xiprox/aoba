import 'package:aoba/exts/duration_exts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toAiringCountdown()', () {
    test('Greater than 100 weeks', () async {
      expect(
        const Duration(
          days: 7 * 111,
          hours: 2,
          minutes: 32,
          seconds: 4,
        ).toAiringCountdown(),
        '111w',
      );
    });

    test('Less than 100 weeks; greater than 1 week', () {
      expect(
        const Duration(
          days: 8,
          hours: 22,
          minutes: 32,
          seconds: 4,
        ).toAiringCountdown(),
        '1w 1d',
      );
      expect(
        const Duration(
          days: 7,
          hours: 22,
          minutes: 32,
          seconds: 4,
        ).toAiringCountdown(),
        '1w',
      );
    });

    test('Less than 1 week; greater than 1 day', () {
      expect(
        const Duration(
          days: 1,
          hours: 20,
          minutes: 40,
          seconds: 2,
        ).toAiringCountdown(),
        '1d 20h',
      );
    });

    test('Less than 1 day; greater than 1 hour', () {
      expect(
        const Duration(
          days: 0,
          hours: 1,
          minutes: 42,
          seconds: 2,
        ).toAiringCountdown(),
        '1h 42m',
      );
    });

    test('Less than 1 hour; greater than 1 minute', () {
      expect(
        const Duration(
          days: 0,
          hours: 0,
          minutes: 1,
          seconds: 24,
        ).toAiringCountdown(),
        '1m 24s',
      );
    });

    test('Less than 1 minute; greater than 1 second', () {
      expect(
        const Duration(
          days: 0,
          hours: 0,
          minutes: 0,
          seconds: 7,
        ).toAiringCountdown(),
        '7s',
      );
    });
  });
}
