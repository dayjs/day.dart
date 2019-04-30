import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  group('Set Methods', () {
    test('Set year', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.year(2020);

      expect(d.year(), equals(2019));
      expect(d.time.year, equals(2019));

      expect(dClone.year(), equals(2020));
      expect(dClone.time.year, equals(2020));
    });

    test('Set month', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.month(5);

      expect(d.month(), equals(4));
      expect(d.time.month, equals(4));

      expect(dClone.month(), equals(5));
      expect(dClone.time.month, equals(5));
    });

    test('Set day', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.day(29);

      expect(d.day(), equals(30));
      expect(d.time.day, equals(30));

      expect(dClone.day(), equals(29));
      expect(dClone.time.day, equals(29));
    });

    test('Set hour', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.hour(11);

      expect(d.hour(), equals(10));
      expect(d.time.hour, equals(10));

      expect(dClone.hour(), equals(11));
      expect(dClone.time.hour, equals(11));
    });

    test('Set minute', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.minute(31);

      expect(d.minute(), equals(30));
      expect(d.time.minute, equals(30));

      expect(dClone.minute(), equals(31));
      expect(dClone.time.minute, equals(31));
    });

    test('Set second', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.second(32);

      expect(d.second(), equals(30));
      expect(d.time.second, equals(30));

      expect(dClone.second(), equals(32));
      expect(dClone.time.second, equals(32));
    });

    test('Set millisecond', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.millisecond(1);

      expect(d.millisecond(), equals(0));
      expect(d.time.millisecond, equals(0));

      expect(dClone.millisecond(), equals(1));
      expect(dClone.time.millisecond, equals(1));
    });

    test('Chainable', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final dClone = d.year(2020).month(5);

      expect(d.year(), equals(2019));
      expect(d.time.year, equals(2019));

      expect(d.month(), equals(4));
      expect(d.time.month, equals(4));

      expect(dClone.year(), equals(2020));
      expect(dClone.time.year, equals(2020));

      expect(dClone.month(), equals(5));
      expect(dClone.time.month, equals(5));
    });
  });
}
