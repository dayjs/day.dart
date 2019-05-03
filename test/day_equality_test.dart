import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  test('Equality', () {
    final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
    final d2 = Day.fromString('2019-04-30T10:30:30.000Z');
    final d3 = Day.fromString('2019-04-30T10:30:30.001Z');

    expect(d1 == d2, equals(true));
    expect(d1 == d3, equals(false));
  });
}
