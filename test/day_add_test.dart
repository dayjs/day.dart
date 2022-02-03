import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('Add Method:', () {
    test('1 year', () {
      final dClone = d.add(1, 'year')!;

      expect(d.year(), equals(2019));

      expect(dClone.year(), equals(2020));
    });

    test('-1 year', () {
      final dClone = d.add(-1, 'year')!;

      expect(d.year(), equals(2019));

      expect(dClone.year(), equals(2018));
    });

    test('2 months', () {
      final dClone = d.add(2, 'month')!;

      expect(d.month(), equals(4));

      expect(dClone.month(), equals(6));
    });

    test('9 months', () {
      final dClone = d.add(9, 'month')!;

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2020));
      expect(dClone.month(), equals(1));
    });

    test('-6 months', () {
      final dClone = d.add(-6, 'month')!;

      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2018));
      expect(dClone.month(), equals(10));
    });

    test('1 day', () {
      final dClone = d.add(1, 'date')!;

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(5));
      expect(dClone.date(), equals(1));
    });

    test('-1 day', () {
      final dClone = d.add(-1, 'date')!;

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(4));
      expect(dClone.date(), equals(29));
    });

    test('-30 day', () {
      final dClone = d.add(-30, 'date')!;

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(3));
      expect(dClone.date(), equals(31));
    });

    test('1 hour', () {
      final dClone = d.add(1, 'hour')!;

      expect(d.hour(), equals(10));

      expect(dClone.hour(), equals(11));
    });

    test('-1 hour', () {
      final dClone = d.add(-1, 'hour')!;

      expect(d.hour(), equals(10));

      expect(dClone.hour(), equals(9));
    });

    test('-11 hour', () {
      final dClone = d.add(-11, 'hour')!;

      expect(d.hour(), equals(10));

      expect(dClone.date(), equals(29));
      expect(dClone.hour(), equals(23));
    });

    test('1 minute', () {
      final dClone = d.add(1, 'minute')!;

      expect(d.minute(), equals(30));

      expect(dClone.minute(), equals(31));
    });

    test('-1 minute', () {
      final dClone = d.add(-1, 'minute')!;

      expect(d.minute(), equals(30));

      expect(dClone.minute(), equals(29));
    });

    test('1 second', () {
      final dClone = d.add(1, 'second')!;

      expect(d.second(), equals(30));

      expect(dClone.second(), equals(31));
    });

    test('-1 second', () {
      final dClone = d.add(-1, 'second')!;

      expect(d.second(), equals(30));

      expect(dClone.second(), equals(29));
    });

    test('1 ms', () {
      final dClone = d.add(1, 'ms')!;

      expect(d.millisecond(), equals(0));

      expect(dClone.millisecond(), equals(1));
    });

    test('-1 ms', () {
      final dClone = d.add(-1, 'ms')!;

      expect(d.millisecond(), equals(0));

      expect(dClone.second(), equals(29));
      expect(dClone.millisecond(), equals(999));
    });
  });
}
