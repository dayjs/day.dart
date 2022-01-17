import '../day.dart';

/// Checks if a [Day] instance is a leap year.
///
/// Reference: https://stackoverflow.com/a/11595914/5676489
extension IsLeapYear on Day {
  bool isLeapYear() {
    final y = year();

    return y & 3 == 0 && (y % 25 != 0 || y & 15 == 0);
  }
}
