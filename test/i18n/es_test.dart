import 'package:test/test.dart';
import 'package:day/day.dart';
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
  });
}
