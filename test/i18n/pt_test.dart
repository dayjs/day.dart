import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/pt.dart' as pt_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(pt_locale.locale);

  group('PT', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('abr. abril'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('ter. terça terça-feira'));
    });

    test('AM', () {
      expect(d.format('A'), equals('a.m.'));
    });
  });
}
