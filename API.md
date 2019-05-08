# API Documentation

Day.dart use `dart:core` library's `DateTime` class and expand its functionality, make it more useful.

Also inherit from Day.js, part of manipulations is immutable.

[API Documentation](#api-documentation)
  - [Import](#import)
  - [Constructor](#constructor)
    - [Without Parameter](#without-parameter)
    - [From String](#from-string)
    - [From DateTime](#from-datetime)
    - [From Unix](#from-unix)
    - [From Day Instance](#from-day-instance)
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
    - [As String](#as-string)
    - [As ISO 8601 String](#as-iso-8601-string)
    - [Time zone Name](#time-zone-name)
    - [Time zone Offset](#time-zone-offset)
    - [Difference](#difference)
  - [Query](#query)
    - [Compare To](#compare-to)
    - [Is Before](#is-before)
    - [Is After](#is-after)
    - [Is Utc](#is-utc)
  - [Transformation](#transformation)
    - [To Utc](#to-utc)
    - [To Local](#to-local)

## Import

```dart
import 'package:day/day.dart';
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
Day().year();
Day().year(2020);
```

### Month `.month()`

Gets or sets the month. Starts at 1.

```dart
Day().month();
Day().month(1);
```

### Day of the month `.date()`

Gets or sets the date. Starts at 1.

```dart
Day().date();
Day().date(1);
```

### Day of the week `.weekday()`

Get the weekday. Starts at 1. **(Only Get, No Set)**

```dart
Day().weekday();
```

### Hour `.hour()`

Gets or sets the hour.


```dart
Day().hour();
Day().hour(12);
```

### Minute `.minute()`

Gets or sets the minute.

```dart
Day().minute();
Day().minute(45);
```

### Second `.second()`

Gets or sets the second.

```dart
Day().second();
Day().second(55);
```

### Millisecond `.millisecond()`

Gets or sets the millisecond.

```dart
Day().millisecond();
Day().millisecond(128);
```

### Get `.get(String unit)`

Returns a number associate with the unit from Day instance.

```
Day().get('month');
Day().get('date');
Day().get('weekday');
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

You must call `.finished()` method to apply all changes.

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

Only `.set()` support unit shorthand (See Above).

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
Day().add(1, 'date');
```

### Subtract `.subtract(int val, String unit)`

Returns a cloned day with a specified amount of time subtracted.

```dart
Day().subtract(1, 'date');
```

### Inc (Same as add)

A `.add()` shorthand.

```dart
Day().inc(1, 'date');
```

### Dec (Same as subtract)

A `.subtract()` shorthand.

```dart
Day().dec(1, 'date');
```

## Displaying

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

### Difference

Returns a number with the difference between two days by specified unit.

```dart
final d1 = Day.fromString('2019-04-30T10:30:30.000Z');
final d2 = Day.fromString('2021-05-01T10:30:30.000Z');

d1.diff(d2, 'y'); // 2
```

Support unit shorthand.

## Query

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
