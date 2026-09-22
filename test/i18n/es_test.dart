import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';
import 'package:day/i18n/es.dart' as es_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(es_locale.locale);

  group('ES', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('abr abril'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('MA mar martes'));
    });

    test('AM', () {
      expect(d.format('A'), equals('a.\u202fm.'));
    });

    test('September and PM', () {
      final date =
          Day.fromString('2020-09-01T13:00:00Z').useLocale(es_locale.locale);
      expect(date.format('MMM A'), 'sept p.\u202fm.');
    });

    test('RelativeTime', () {
      final target = d.add(2, 'm')!;
      expect(d.to(target), 'dentro de 2 minutos');
      expect(d.from(target), 'hace 2 minutos');
    });
  });
}
