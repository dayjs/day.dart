import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/ja.dart' as ja_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(ja_locale.locale);

  group('JA', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('4月 4月'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('火 火 火曜日'));
    });

    test('AM', () {
      expect(d.format('A'), equals('午前'));
    });
  });
}
