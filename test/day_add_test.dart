import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  group('Add Method:', () {
    test('Add 1 year', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'year');

      expect(d.year(), equals(2019));
      expect(dClone.year(), equals(2020));
    });

    test('Add 2 months', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(2, 'month');

      expect(d.month(), equals(4));
      expect(dClone.month(), equals(6));
    });

    test('add 9 months', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(9, 'month');

      expect(d.year(), equals(2019));
      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2020));
      expect(dClone.month(), equals(1));
    });

    test('Add 1 day', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'date');

      expect(d.month(), equals(4));
      expect(d.date(), equals(30));

      expect(dClone.month(), equals(5));
      expect(dClone.date(), equals(1));
    });

    test('Add 1 hour', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'hour');

      expect(d.hour(), equals(10));
      expect(dClone.hour(), equals(11));
    });

    test('Add 1 minute', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'minute');

      expect(d.minute(), equals(30));
      expect(dClone.minute(), equals(31));
    });

    test('Add 1 second', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'second');

      expect(d.second(), equals(30));
      expect(dClone.second(), equals(31));
    });

    test('Add 1 ms', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.add(1, 'ms');

      expect(d.millisecond(), equals(0));
      expect(dClone.millisecond(), equals(1));
    });
  });
}
