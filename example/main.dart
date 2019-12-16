// View https://github.com/dayjs/day.dart for more usage.

import 'package:day/day.dart';

void main() {
  final now = Day();

  // Tomorrow
  final tomorrow = now.add(1, 'date');
  print(tomorrow);

  // Chainable
  now
    ..setYear(2020)
    ..setMonth(1)
    ..setDate(1)
    ..finished();

  // Get year
  print(now.year());
}
