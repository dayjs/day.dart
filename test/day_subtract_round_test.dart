import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  test(
      '.subtractRound(1, \'M\') returns a date not exceeding the current month',
      () {
    final d = Day.fromString('2022-03-31T15:52:50.000Z').subtractRound(1, 'M')!;

    expect(d.month(), equals(2));
    expect(d.date(), 28);
  });

  test(
      '.subtractRound(1, \'y\') returns a date not exceeding the current month',
      () {
    final d = Day.fromString('2020-02-29T15:52:50.000Z').subtractRound(1, 'y')!;

    expect(d.month(), equals(2));
    expect(d.date(), 28);
  });
}
