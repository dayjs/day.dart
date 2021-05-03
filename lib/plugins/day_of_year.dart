import '../day.dart';

/// Gets or sets the day of the year from a [Day] instance.
extension DayOfYear on Day {
  dynamic dayOfYear([int? val]) {
    final firstTimeOfYear = clone()
      ..setMonth(1)
      ..setDate(0)
      ..finished();

    if (val == null) {
      return diff(firstTimeOfYear, 'd');
    } else {
      return firstTimeOfYear.add(val, 'd');
    }
  }
}
