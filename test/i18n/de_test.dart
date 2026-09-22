import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/de.dart' as de_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(de_locale.locale);

  group('DE', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('Apr. April'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('Di. Di. Dienstag'));
      final names = ['Mo.', 'Di.', 'Mi.', 'Do.', 'Fr.', 'Sa.', 'So.'];
      for (var index = 0; index < names.length; index++) {
        final date = Day.fromDateTime(DateTime.utc(2020, 1, 6 + index))
            .useLocale(de_locale.locale);
        expect(date.format('WW'), names[index]);
      }
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });

    group('RelativeTime cases', () {
      final cases = [
        (1, 'm', 'eine Minute', 'einer Minute'),
        (2, 'm', '2 Minuten', '2 Minuten'),
        (1, 'h', 'eine Stunde', 'einer Stunde'),
        (2, 'h', '2 Stunden', '2 Stunden'),
        (1, 'd', 'ein Tag', 'einem Tag'),
        (2, 'd', '2 Tage', '2 Tagen'),
        (1, 'M', 'ein Monat', 'einem Monat'),
        (2, 'M', '2 Monate', '2 Monaten'),
        (1, 'y', 'ein Jahr', 'einem Jahr'),
        (2, 'y', '2 Jahre', '2 Jahren'),
      ];

      for (final (count, unit, standalone, withSuffix) in cases) {
        test('$count $unit', () {
          final target = d.add(count, unit)!;
          expect(d.to(target), 'in $withSuffix');
          expect(d.from(target), 'vor $withSuffix');
          expect(d.to(target, true), standalone);
          expect(d.from(target, true), standalone);
        });
      }
    });
  });
}
