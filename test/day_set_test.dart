import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  group('Set Methods:', () {
    test('Set year', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.year(2020);

      expect(d.year(), equals(2019));

      expect(dClone.year(), equals(2020));
    });

    test('Set month', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.month(5);

      expect(d.month(), equals(4));

      expect(dClone.month(), equals(5));
    });

    test('Set day', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.date(29);

      expect(d.date(), equals(30));

      expect(dClone.date(), equals(29));
    });

    test('Set hour', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.hour(11);

      expect(d.hour(), equals(10));

      expect(dClone.hour(), equals(11));
    });

    test('Set minute', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.minute(31);

      expect(d.minute(), equals(30));

      expect(dClone.minute(), equals(31));
    });

    test('Set second', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.second(32);

      expect(d.second(), equals(30));

      expect(dClone.second(), equals(32));
    });

    test('Set millisecond', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.millisecond(1);

      expect(d.millisecond(), equals(0));

      expect(dClone.millisecond(), equals(1));
    });

    test('Chainable', () {
      final d = Day.fromString('2019-04-30T10:30:30.000Z');
      final Day dClone = d.year(2020).month(5);

      expect(d.year(), equals(2019));

      expect(d.month(), equals(4));

      expect(dClone.year(), equals(2020));

      expect(dClone.month(), equals(5));
    });
  });
}
