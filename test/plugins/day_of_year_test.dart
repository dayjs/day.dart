import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/day_of_year.dart';

void main() {
  test('Plugin => Day Of Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d1001 = d.dayOfYear(274);

    expect(d.dayOfYear(), equals(120));
    expect(d1001.month(), equals(10));
    expect(d1001.date(), equals(1));
  });
}
