import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('Subtract Method:', () {
    test('1 year', () {
      final dClone = d.subtract(1, 'year')!;

      expect(d.year(), equals(2019));

      expect(dClone.year(), equals(2018));
    });

    test('-1 year', () {
      final dClone = d.subtract(-1, 'year')!;

      expect(d.year(), equals(2019));

      expect(dClone.year(), equals(2020));
    });

    test('2 months', () {
      final dClone = d.subtract(2, 'month')!;

      expect(d.month(), equals(4));

      expect(dClone.month(), equals(3));
    });

    test('4 months', () {
      final dClone = d.subtract(4, 'month')!;

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2018));
      expect(dClone.month(), equals(12));
    });

    test('28 months', () {
      final dClone = d.subtract(28, 'month')!;

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2016));
      expect(dClone.month(), equals(12));
    });

    test('-8 months', () {
      final dClone = d.subtract(-8, 'month')!;

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2019));
      expect(dClone.month(), equals(12));
    });

    test('-9 months', () {
      final dClone = d.subtract(-9, 'month')!;

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2020));
      expect(dClone.month(), equals(1));
    });

    test('1 day', () {
      final dClone = d.subtract(1, 'date')!;

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(4));
      expect(dClone.date(), equals(29));
    });

    test('1 week supports full and shorthand units', () {
      final fullUnit = d.subtract(1, 'week')!;
      final shorthand = d.subtract(1, 'w')!;

      expect(
        fullUnit.toDateTime(),
        equals(DateTime.utc(2019, 4, 23, 10, 30, 30)),
      );
      expect(shorthand, equals(fullUnit));
    });

    test('-1 week adds a week', () {
      expect(
        d.subtract(-1, 'week')!.toDateTime(),
        equals(DateTime.utc(2019, 5, 7, 10, 30, 30)),
      );
    });

    test('1 week reaches February 29 in a leap year', () {
      final start = Day.fromString('2020-03-07T10:30:30.000Z');

      expect(
        start.subtract(1, 'week')!.toDateTime(),
        equals(DateTime.utc(2020, 2, 29, 10, 30, 30)),
      );
    });

    test('1 hour', () {
      final dClone = d.subtract(1, 'hour')!;

      expect(d.hour(), equals(10));

      expect(dClone.hour(), equals(9));
    });

    test('-1 hour', () {
      final dClone = d.subtract(-1, 'hour')!;

      expect(d.hour(), equals(10));

      expect(dClone.hour(), equals(11));
    });

    test('1 minute', () {
      final dClone = d.subtract(1, 'minute')!;

      expect(d.minute(), equals(30));

      expect(dClone.minute(), equals(29));
    });

    test('-1 minute', () {
      final dClone = d.subtract(-1, 'minute')!;

      expect(d.minute(), equals(30));

      expect(dClone.minute(), equals(31));
    });

    test('1 second', () {
      final dClone = d.subtract(1, 'second')!;

      expect(d.second(), equals(30));

      expect(dClone.second(), equals(29));
    });

    test('-1 second', () {
      final dClone = d.subtract(-1, 'second')!;

      expect(d.second(), equals(30));

      expect(dClone.second(), equals(31));
    });

    test('1 ms', () {
      final dClone = d.subtract(1, 'ms')!;

      expect(d.millisecond(), equals(0));

      expect(dClone.millisecond(), equals(999));
    });

    test('-1 ms', () {
      final dClone = d.subtract(-1, 'ms')!;

      expect(d.millisecond(), equals(0));

      expect(dClone.millisecond(), equals(1));
    });
  });
}
