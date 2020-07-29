import '../day.dart';

/// Gets or sets the quarter of the year from a [Day] instance.
extension QuarterOfYear on Day {
  quarter([int val]) {
    final int month = this.month();
    final currentQuarter = (month / 3).ceil();

    if (val == null) {
      return currentQuarter;
    } else {
      final quarter = val > 4 ? 4 : val < 1 ? 1 : val;
      final rem = month % 3;

      return currentQuarter == quarter
          ? this.clone()
          : this.month((rem == 0 ? 3 : rem) + (quarter - 1) * 3);
    }
  }
}
