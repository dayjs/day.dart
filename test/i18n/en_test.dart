import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('EN', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('Apr April'));
      expect(d.format('D MMM YYYY'), '30 Apr 2019');
      expect(d.format('D MMMM YYYY'), '30 April 2019');
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('Tu Tue Tuesday'));
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });
  });
}
