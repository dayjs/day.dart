import 'package:test/test.dart';
import 'package:day.dart/day.dart';

void main() {
  test('Chainable', () {
    final d = Day.fromString('2019-04-30T10:30:30.000Z');

    d
      ..setYear(2020)
      ..setMonth(5)
      ..setDate(1)
      ..finished();

    expect(d.year(), equals(2020));
    expect(d.month(), equals(5));
    expect(d.date(), equals(1));
  });
}
