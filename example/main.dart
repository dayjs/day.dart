// View https://github.com/g1eny0ung/day.dart for more usage.

import 'package:day/day.dart';

void main() {
  final now = Day();

  // After one day
  final afterOneDay = now.add(1, 'date');
  print(afterOneDay);

  // chainable
  now
    ..setYear(2020)
    ..setMonth(5)
    ..setDate(1)
    ..finished();

  // Get year
  print(now.year());
}
