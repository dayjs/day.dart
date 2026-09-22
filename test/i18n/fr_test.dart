import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/fr.dart' as fr_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(fr_locale.locale);

  group('FR', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('avr. avril'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('ma mar. mardi'));
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });
  });
}
