import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  group('Day Constructor:', () {
    test('No named', () {
      final d = Day();

      expect(d.isValid(), true);
    });

    test('fromString (ISO 8601)', () {
      final d = Day.fromString('1970-01-01T00:00:00.000Z');

      expect(d.isValid(), true);
    });

    test('fromDateTime', () {
      final d = Day.fromDateTime(DateTime.now());

      expect(d.isValid(), true);
    });

    test('fromUnix', () {
      final d = Day.fromUnix(0);

      expect(d.isValid(), true);
    });

    test('fromDayInstance', () {
      final d = Day.fromDayInstance(Day());

      expect(d.isValid(), true);
    });
  });
}
