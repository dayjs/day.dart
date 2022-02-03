import '../day.dart';

bool isLeapYearFunc(int y) => y & 3 == 0 && (y % 25 != 0 || y & 15 == 0);

/// Checks if a [Day] instance is a leap year.
///
/// Reference: https://stackoverflow.com/a/11595914/5676489
extension IsLeapYear on Day {
  bool isLeapYear() => isLeapYearFunc(year());
}
