# Plugins

- [Introduction](#introduction)
- [Plugins List](#plugins-list)
  - [Is Leap Year](#is-leap-year)
  - [Relative Time](#relative-time)
  - [Day Of Year](#day-of-year)
  - [Quarter Of Year](#quarter-of-year)

## Introduction

Day.dart use the `extension` syntax to implement plugins system. (Require the dart version >= 2.7.0)

For example:

[lib/plugins/is_leap_year.dart](lib/plugins/is_leap_year.dart)

```dart
import '../day.dart';

/// Check a [Day] instance is a leap year or not.
///
/// Reference: https://stackoverflow.com/a/11595914/5676489
extension IsLeapYear on Day {
  bool isLeapYear() {
    final y = year();

    return y & 3 == 0 && (y % 25 != 0 || y & 15 == 0);
  }
}
```

Then you can use it like:

[test/plugins/is_leap_year_test.dart](test/plugins/is_leap_year_test.dart)

```dart
import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/is_leap_year.dart';

void main() {
  test('Plugin => Is Leap Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d2000 = Day.fromString('2000-01-01');
    final d2100 = Day.fromString('2100-01-01');

    expect(d.isLeapYear(), equals(false));
    expect(d2000.isLeapYear(), equals(true));
    expect(d2100.isLeapYear(), equals(false));
  });
}
```

⚙️ Welcome PRs to add a new plugin.️

## Plugins List

### Is Leap Year

Check a Day instance is a leap year or not.

```dart
import 'package:day/day.dart';
import 'package:day/plugins/is_leap_year.dart';

void main() {
  final d = Day.fromString('2019-04-30T10:30:30.001Z');

  print(d.isLeapYear()); // false
}
```

### Relative Time

Add relative time support.

This plugin includes four methods: from, fromNow, to, toNow. All of them can help you to format date to a relative time string.

```dart
import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/relative_time.dart';

void main() {
  group('Plugin => Relative Time =>', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d1 = d.add(1, 's');

    test('from', () {
      final fromD1 = d.from(d1);

      expect(fromD1, equals('a few seconds ago'));
    });
  });
}
```

#### List of breakdown range

| Range                    | Key | Sample Output                    |
| ------------------------ | --- | -------------------------------- |
| 0 to 44 seconds          | s   | a few seconds ago                |
| 45 to 89 seconds         | m   | a minute ago                     |
| 90 seconds to 44 minutes | mm  | 2 minutes ago ... 44 minutes ago |
| 45 to 89 minutes         | h   | an hour ago                      |
| 90 minutes to 21 hours   | hh  | 2 hours ago ... 21 hours ago     |
| 22 to 35 hours           | d   | a day ago                        |
| 36 hours to 25 days      | dd  | 2 days ago ... 25 days ago       |
| 26 to 45 days            | M   | a month ago                      |
| 46 days to 10 months     | MM  | 2 months ago ... 10 months ago   |
| 11 months to 17months    | y   | a year ago                       |
| 18 months+               | yy  | 2 years ago ... 20 years ago     |

### Day Of Year

Gets or sets the day of the year.

```dart
import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/day_of_year.dart';

void main() {
  test('Plugin => Day Of Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final d1001 = d.dayOfYear(274);

    expect(d.dayOfYear(), equals(120));
    expect(d1001.month(), equals(10));
    expect(d1001.date(), equals(1));
  });
}
```

### Quarter Of Year

Gets or sets the quarter of the year.

```dart
import 'package:test/test.dart';
import 'package:day/day.dart';
import 'package:day/plugins/quarter_of_year.dart';

void main() {
  test('Plugin => Quarter Of Year', () {
    final d = Day.fromString('2019-04-30T10:30:30.001Z');
    final Day dMonth10 = d.quarter(4);
    final dMonth10Quarter2 = dMonth10.quarter(2);

    expect(d.quarter(), equals(2));
    expect(dMonth10.month(), equals(10));
    expect(dMonth10Quarter2.month(), equals(4));

    final Day dMonth12 = d.month(12);
    final dMonth12Quarter2 = dMonth12.quarter(2);

    expect(dMonth12Quarter2.month(), equals(6));

    final d2020 = Day.fromString('2020-01-01');
    final d2020Quarter3 = d2020.quarter(3);

    expect(d2020.quarter(), equals(1));
    expect(d2020Quarter3.month(), equals(7));

    final d20130205 = Day.fromString('2013-02-05T05:06:07.000');

    expect(d20130205.quarter(2).month(), equals(5));
  });
}
```
