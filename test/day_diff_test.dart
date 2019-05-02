import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  group('Diff:', () {
    test('2 years', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2021-05-01T10:30:30.000Z');

      expect(d1.diff(d2, 'y'), equals(2));
    });

    test('22 months', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2021-02-01T10:30:30.000Z');

      expect(d1.diff(d2, 'M'), equals(22));
    });

    test('33 days', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2019-06-02T10:30:30.000Z');

      expect(d1.diff(d2, 'd'), equals(33));
    });

    test('10 hours', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2019-04-30T20:30:30.000Z');

      expect(d1.diff(d2, 'h'), equals(10));
    });

    test('55 minutes', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2019-04-30T11:25:30.000Z');

      expect(d1.diff(d2, 'm'), equals(55));
    });

    test('3s', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2019-04-30T10:30:33.000Z');

      expect(d1.diff(d2, 's'), equals(3));
    });

    test('333ms', () {
      final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
      final d2 = Day.fromString('2019-04-30T10:30:30.333Z');

      expect(d1.diff(d2, 'ms'), equals(333));
    });
  });
}
