# API Documentation

Day.dart uses `dart:core`'s `DateTime` class and expand its functionality to make it more useful.

Also inherit from Day.js, part of manipulations is immutable.

- [Import](#import)
- [Constructor](#constructor)
  - [Without Parameter](#without-parameter)
  - [From String](#from-string)
  - [From DateTime](#from-datetime)
  - [From Unix](#from-unix)
  - [From Day Instance](#from-day-instance)
- [Check Is Valid](#check-is-valid)
- [Clone](#clone)
- [Get And Set](#get-and-set)
  - [Year `.year()`](#year-year)
  - [Month `.month()`](#month-month)
  - [Day of the Month `.date()`](#day-of-the-month-date)
  - [Day of the Week `.weekday()`](#day-of-the-week-weekday)
  - [Hour `.hour()`](#hour-hour)
  - [Minute `.minute()`](#minute-minute)
  - [Second `.second()`](#second-second)
  - [Millisecond `.millisecond()`](#millisecond-millisecond)
  - [Get `.get(String unit)`](#get-getstring-unit)
    - [List of all available units](#list-of-all-available-units)
  - [Set `.set(String unit, int val)`](#set-setstring-unit-int-val)
    - [List of all available methods](#list-of-all-available-methods)
- [Manipulating](#manipulating)
  - [Add `.add(int val, String unit)`](#add-addint-val-string-unit)
  - [Subtract `.subtract(int val, String unit)`](#subtract-subtractint-val-string-unit)
  - [Inc (Same as add)](#inc-same-as-add)
  - [Dec (Same as subtract)](#dec-same-as-subtract)
- [Displaying](#displaying)
  - [Format `.format()`](#format-format)
  - [As String](#as-string)
  - [As ISO 8601 String](#as-iso-8601-string)
  - [Time zone Name](#time-zone-name)
  - [Time zone Offset](#time-zone-offset)
- [Query](#query)
  - [Difference](#difference)
  - [Compare To](#compare-to)
  - [Is Before](#is-before)
  - [Is After](#is-after)
  - [Is Utc](#is-utc)
- [Transformation](#transformation)
  - [To Utc](#to-utc)
  - [To Local](#to-local)
  - [To DateTime](#to-datetime)

## Import

```dart
import 'package:day/day.dart';
```

With plugins:

```dart
import 'package:day/day.dart';
import 'package:day/plugins/is_leap_year.dart';
```

## Constructor

### Without Parameter

If you don't pass a parameter to `Day`, it will returns the current time.

```dart
final now = Day();
```

### From String

[ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string.

```dart
Day.fromString('2019-04-30T10:30:30.000Z');
```

### From DateTime

Pass a `DateTime` instance.

```dart
final now = Day.fromDateTime(DateTime.now());
```

### From Unix

This will call `DateTime.fromMillisecondsSinceEpoch()` to initialize a Day.

```dart
final d = Day.fromUnix(0);
```

### From Day Instance

```dart
final now = Day();
final afterNow = Day.fromDayInstance(now);
```

## Check Is Valid

Check whether a day instance is valid. If `false`, indicates that the instance did not initialize successfully.

```dart
final now = Day();
final isValid = now.isValid()
```

## Clone

Call `.clone()` will return a new day instance.

```dart
final now = Day();
final nowClone = now.clone();
```

## Get And Set

### Year `.year()`

Gets or sets the year.

```dart
final d = Day();

d.year();
d.year(2020);
```

### Month `.month()`

Gets or sets the month. Starts at 1.

```dart
final d = Day();

d.month();
d.month(1);
```

### Day of the month `.date()`

Gets or sets the date. Starts at 1.

```dart
final d = Day();

d.date();
d.date(1);
```

### Day of the week `.weekday()`

Get the weekday. Starts at 1. **(Only Get, No Set)**

```dart
final d = Day();

d.weekday();
```

### Hour `.hour()`

Gets or sets the hour.

```dart
final d = Day();

d.hour();
d.hour(12);
```

### Minute `.minute()`

Gets or sets the minute.

```dart
final d = Day();

d.minute();
d.minute(45);
```

### Second `.second()`

Gets or sets the second.

```dart
final d = Day();

d.second();
d.second(55);
```

### Millisecond `.millisecond()`

Gets or sets the millisecond.

```dart
final d = Day();

d.millisecond();
d.millisecond(128);
```

### Get `.get(String unit)`

Returns a number associate with the unit from Day instance.

```dart
final d = Day();

d.get('month');
d.get('date');
d.get('weekday');
```

#### List of all available units

| Unit          | Shorthand | Description                            |
| ------------- | --------- | -------------------------------------- |
| `year`        | `y`       | Year                                   |
| `month`       | `M`       | Month (January as 1, December as 12)   |
| `date`        | `d`       | Date of Month                          |
| `weekday`     | `w`       | Day of Week (Monday as 1, Sunday as 7) |
| `hour`        | `h`       | Hour                                   |
| `minute`      | `m`       | Minute                                 |
| `second`      | `s`       | Second                                 |
| `millisecond` | `ms`      | Millisecond                            |

### Set `.set(String unit, int val)`

Different from `Day.js`, `Day.dart` won't create a new Instance after setting.

All set methods will change the origin instance.

You must call **`.finished()`** method to apply all changes.

For example:

```dart
final d = Day.fromString('2019-04-30T10:30:30.000Z');

d
  ..setYear(2020)
  ..setMonth(5)
  ..setDate(1)
  ..finished();
```

#### List of all available methods

Only **`.set()`** support unit shorthand (See Above).

Use **`.setValue()`** for semantics.

```dart
d
  ..set('y', 2020)
  ..set('M', 5)
  ..set('d', 1)
  ..finished();
```

| Method              | Shorthand                    | Shorthand2              |
| ------------------- | ---------------------------- | ----------------------- |
| `.setYear()`        | `setValue('year', 2020)`     | `set('year', 2020)`     |
| `.setMonth()`       | `setValue('month', 5)`       | `set('month', 5)`       |
| `.setDate()`        | `setValue('date', 1)`        | `set('date', 1)`        |
| `.setHour()`        | `setValue('hour', 11)`       | `set('hour', 11)`       |
| `.setMinute()`      | `setValue('minute', 31)`     | `set('minute', 31)`     |
| `.setSecond()`      | `setValue('second', 31)`     | `set('second', 31)`     |
| `.setMillisecond()` | `setValue('millisecond', 1)` | `set('millisecond', 1)` |

## Manipulating

```dart
Day('2019-04-30')
  .add(1, 'date')
  .subtract(1, 'year')
  .toString(); // 2018-05-01 00:00:00.000
```

### Add `.add(int val, String unit)`

Returns a cloned day with a specified amount of time added.

```dart
final d = Day();

d.add(1, 'date');
```

### Subtract `.subtract(int val, String unit)`

Returns a cloned day with a specified amount of time subtracted.

```dart
final d = Day();

d.subtract(1, 'date');
```

### Inc (Same as add)

A `.add()` shorthand.

```dart
final d = Day();

d.inc(1, 'date');
```

### Dec (Same as subtract)

A `.subtract()` shorthand.

```dart
final d = Day();

d.dec(1, 'date');
```

## Displaying

### Format `.format()`

Returns a string with specific format. If no format passed, the `.format()` will call `.toIso8601String()`.

```dart
Day().format(); // 2019-05-08T16:38:31.721959
Day.fromString('2019-05-08').format('YYYY-MM-DDTHH:mm:ss'); // 2019-05-08T00:00:00
```

#### List of all available formats

| Format     | Output           | Description                           |
| ---------- | ---------------- | ------------------------------------- |
| `[escape]` | escape           | Escape string in []                   |
| `YY`       | 19               | Two-digit year                        |
| `YYYY`     | 2019             | Four-digit year                       |
| `M`        | 1-12             | The month, beginning at 1             |
| `MM`       | 01-12            | The month, 2 digits                   |
| `MMM`      | Jan-Dec          | The abbreviated month name            |
| `MMMM`     | January-December | The full month name                   |
| `D`        | 1-31             | The day of the month                  |
| `DD`       | 01-31            | The day of the month, 2 digits        |
| `W`        | 1-7              | The day of the week                   |
| `WW`       | Mo-Su            | The min name of the day of the week   |
| `WWW`      | Mon-Sun          | The short name of the day of the week |
| `WWWW`     | Monday-Sunday    | The name of the day of the week       |
| `H`        | 0-23             | The hour                              |
| `HH`       | 00-23            | The hour, 2 digits                    |
| `h`        | 1-12             | The hour, 12 hour clock               |
| `hh`       | 01-12            | The hour, 12 hour clock, 2 digits     |
| `m`        | 0-59             | The minute                            |
| `mm`       | 00-59            | The minute, 2 digits                  |
| `s`        | 0-59             | The second                            |
| `ss`       | 00-59            | The second, 2 digits                  |
| `SSS`      | 000-999          | The millisecond, 3 digits             |
| `A`        | AM PM            |                                       |
| `a`        | am pm            |                                       |

### As String

Returns a human-readable string for this day.

```dart
Day().toString();
```

### As ISO 8601 String

Returns an ISO-8601 full-precision extended format representation.

```dart
Day().toIso8601String();
```

### Time zone Name

The time zone name.

```dart
Day().timeZoneName;
```

### Time zone Offset

The time zone offset, which is the difference between local time and UTC.

```dart
Day().timeZoneOffset;
```

## Query

### Difference

Returns a number with the difference between two days by specified unit.

```dart
final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
final d2 = Day.fromString('2021-05-01T10:30:30.000Z');

d1.diff(d2, 'y'); // 2
```

Support unit shorthand.

### Compare To

Compare this day to other, returning zero if the values are equal.

-1 is before, 1 is after.

```dart
final now = Day();
final afterNow = now.add(1, 's');

now.compareTo(afterNow); // -1
```

### Is Before

Returns true if this day occurs before other.

```dart
final now = Day();
final afterNow = now.add(1, 's');

now.isBefore(afterNow); // true
```

### Is After

Returns true if this day occurs after other.

```dart
final now = Day();
final afterNow = now.add(1, 's');

now.isAfter(afterNow); // false
```

### Is Utc

True if this day is set to UTC time.

```dart
Day().isUtc;
```

## Transformation

### To Utc

Returns this day in the UTC time zone.

```dart
Day().toUtc();
```

### To Local

Returns this day in the local time zone.

```dart
Day.fromString('2019-04-30T10:30:30.000Z').toLocal();
```

### To DateTime

Returns this day's DateTime instance.

```dart
Day.fromString('2019-04-30T10:30:30.000Z').toDateTime();
```
