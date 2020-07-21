# Plugins

- [Introduction](#introduction)
- [Plugins List](#plugins-list)
  - [Is Leap Year](#is-leap-year)
  - [Relative Time](#relative-time)

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
    final y = this.year();

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
