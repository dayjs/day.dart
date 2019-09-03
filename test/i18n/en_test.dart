import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('En', () {
    test('Months', () {
      expect(d.format('MMM MMMM'), equals('Apr April'));
    });

    test('Weekdays', () {
      expect(d.format('WW WWW WWWW'), equals('Tu Tue Tuesday'));
    });

    test('AM', () {
      expect(d.format('A'), equals('AM'));
    });
  });
}
