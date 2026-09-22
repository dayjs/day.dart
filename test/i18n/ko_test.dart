import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/i18n/ko.dart' as ko_locale;

void main() {
  final d =
      Day.fromString('2019-04-30T10:30:30.000Z').useLocale(ko_locale.locale);

  group('KO', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('4월 4월'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('화 화 화요일'));
    });

    test('AM', () {
      expect(d.format('A'), equals('오전'));
    });
  });
}
