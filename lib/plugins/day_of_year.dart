import '../day.dart';

/// Gets or sets the day of the year from a [Day] instance.
extension DayOfYear on Day {
  dayOfYear([int val]) {
    final firstTimeOfYear = this.clone()
      ..setMonth(1)
      ..setDate(0)
      ..finished();

    if (val == null) {
      return this.diff(firstTimeOfYear, 'd');
    } else {
      return firstTimeOfYear.add(val, 'd');
    }
  }
}
