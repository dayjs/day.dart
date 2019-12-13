import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/is_leap_year.dart';

void main() {
  test('Plugin => Is Leap Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d2000 = Day.fromString('2000-01-01');
    final d2100 = Day.fromString('2100-01-01');

    expect(d.isLeapYear(), false);
    expect(d2000.isLeapYear(), true);
    expect(d2100.isLeapYear(), false);
  });
}
