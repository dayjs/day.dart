import '../src/day.dart';

// https://stackoverflow.com/a/11595914/5676489
extension IsLeapYear on Day {
  bool isLeapYear() {
    final y = this.year();

    return y & 3 == 0 && (y % 25 != 0 || y & 15 == 0);
  }
}
