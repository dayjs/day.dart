import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  group('Subtract Method:', () {
    test('Subtract 1 year', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'year');

      expect(d.year(), equals(2019));
      expect(dClone.year(), equals(2018));
    });

    test('Subtract 2 months', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(2, 'month');

      expect(d.month(), equals(4));
      expect(dClone.month(), equals(2));
    });

    test('Subtract 4 months', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(4, 'month');

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2018));
      expect(dClone.month(), equals(12));
    });

    test('Subtract 28 months', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(28, 'month');

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2016));
      expect(dClone.month(), equals(12));
    });

    test('Subtract 1 day', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'date');

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(4));
      expect(dClone.date(), equals(29));
    });

    test('Subtract 1 hour', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'hour');

      expect(d.hour(), equals(10));
      expect(dClone.hour(), equals(9));
    });

    test('Subtract 1 minute', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'minute');

      expect(d.minute(), equals(30));
      expect(dClone.minute(), equals(29));
    });

    test('Subtract 1 second', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'second');

      expect(d.second(), equals(30));
      expect(dClone.second(), equals(29));
    });

    test('Subtract 1 ms', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.subtract(1, 'ms');

      expect(d.millisecond(), equals(0));
      expect(dClone.millisecond(), equals(999));
    });
  });
}
