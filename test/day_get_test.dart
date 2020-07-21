import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('Get Methods:', () {
    test('year', () {
      expect(d.year(), equals(2019));
    });

    test('month', () {
      expect(d.month(), equals(4));
    });

    test('day', () {
      expect(d.date(), equals(30));
    });

    test('weekday', () {
      expect(d.weekday(), equals(2));
    });

    test('hour', () {
      expect(d.hour(), equals(10));
    });

    test('minute', () {
      expect(d.minute(), equals(30));
    });

    test('second', () {
      expect(d.second(), equals(30));
    });

    test('millisecond', () {
      expect(d.millisecond(), equals(0));
    });

    test('shorthands', () {
      expect(d.get('y'), equals(2019));
      expect(d.get('M'), equals(4));
      expect(d.get('w'), equals(2));
      expect(d.get('d'), equals(30));
      expect(d.get('h'), equals(10));
      expect(d.get('m'), equals(30));
      expect(d.get('s'), equals(30));
      expect(d.get('ms'), equals(0));
    });
  });
}
