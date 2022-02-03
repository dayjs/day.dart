import 'package:test/test.dart';
import 'package:day/day.dart';

void main() {
  final d = Day.fromString('2022-03-31T15:52:50.000Z');

  test('.addRound() returns a date not exceeding the current month', () {
    final dClone = d.addRound(1, 'M')!;

    expect(dClone.month(), equals(4));
    expect(dClone.date(), 30);
  });
}
