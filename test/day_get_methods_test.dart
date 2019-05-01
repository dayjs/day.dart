import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.000Z');

  group('Get Methods', () {
    test('Get year', () {
      expect(d.year(), equals(2019));
    });

    test('Get month', () {
      expect(d.month(), equals(4));
    });

    test('Get day', () {
      expect(d.date(), equals(30));
    });

    test('Get hour', () {
      expect(d.hour(), equals(10));
    });

    test('Get minute', () {
      expect(d.minute(), equals(30));
    });

    test('Get second', () {
      expect(d.second(), equals(30));
    });

    test('Get millisecond', () {
      expect(d.millisecond(), equals(0));
    });
  });
}
