import 'constants.dart' as C;
import 'utils.dart' as U;

/// A [Day] object is a [DateTime] manager.
class Day {
  /// The internal [DateTime] instance of the [Day].
  DateTime _time;

  /// The values of [time].
  ///
  /// Include:
  ///
  /// - year
  /// - month
  /// - date
  /// - weekday
  /// - hour
  /// - minute
  /// - second
  /// - millisecond
  final Map<String, int> _values = {};

  /// Constructs a new [Day] instance with current date and time in the local time zone.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day();
  /// ```
  Day() {
    _time = DateTime.now();
    _parseTime();
  }

  /// Constructs a new [Day] based on an ISO 8601 formatted string.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromString('2019-04-30')
  /// ```
  Day.fromString(String time) {
    _time = DateTime.parse(time);
    _parseTime();
  }

  /// Constructs a new [Day] from a [DateTime] instance.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromDateTime(DateTime.now());
  /// ```
  Day.fromDateTime(DateTime time) {
    _time = time;
    _parseTime();
  }

  /// Constructs a new [Day] from a unix milliseconds.
  ///
  /// This will call the [DateTime]'s fromMillisecondsSinceEpoch method.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromUnix(0);
  /// ```
  Day.fromUnix(int time) {
    _time = DateTime.fromMillisecondsSinceEpoch(time);
    _parseTime();
  }

  /// Constructs a new [Day] from a [Day].
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromDayInstance(Day());
  /// ```
  Day.fromDayInstance(Day day) {
    _time = day.time;
    _parseTime();
  }

  /// The internal time of this [Day], **do not use it publicly**.
  DateTime get time => _time;

  /// Clone this [Day]
  ///
  /// returns a new [Day] instance.
  Day clone() => Day.fromDateTime(time);

  /// Get or set the year of this [Day].
  ///
  /// When setting a new year, it will return a new [Day] instance with the new year.
  year([int year]) {
    if (year == null) {
      return _values['year'];
    } else {
      return _cloneAndSetSingleValue('year', year);
    }
  }

  /// Get or set the month of this [Day].
  ///
  /// When setting a new month, it will return a new [Day] instance with the new month.
  month([int month]) {
    if (month == null) {
      return _values['month'];
    } else {
      return _cloneAndSetSingleValue('month', month);
    }
  }

  /// Get or set the date of this [Day].
  ///
  /// When setting a new date, it will return a new [Day] instance with the new date.
  date([int date]) {
    if (date == null) {
      return _values['date'];
    } else {
      return _cloneAndSetSingleValue('date', date);
    }
  }

  /// Get the weekday of this [Day].
  int weekday() {
    return _values['weekday'];
  }

  /// Get or set the hour of this [Day].
  ///
  /// When setting a new hour, it will return a new [Day] instance with the new hour.
  hour([int hour]) {
    if (hour == null) {
      return _values['hour'];
    } else {
      return _cloneAndSetSingleValue('hour', hour);
    }
  }

  /// Get or set the minute of this [Day].
  ///
  /// When setting a new minute, it will return a new [Day] instance with the new minute.
  minute([int minute]) {
    if (minute == null) {
      return _values['minute'];
    } else {
      return _cloneAndSetSingleValue('minute', minute);
    }
  }

  /// Get or set the second of this [Day].
  ///
  /// When setting a new second, it will return a new [Day] instance with the new second.
  second([int second]) {
    if (second == null) {
      return _values['second'];
    } else {
      return _cloneAndSetSingleValue('second', second);
    }
  }

  /// Get or set the millisecond of this [Day].
  ///
  /// When setting a new millisecond, it will return a new [Day] instance with the new millisecond.
  millisecond([int millisecond]) {
    if (millisecond == null) {
      return _values['millisecond'];
    } else {
      return _cloneAndSetSingleValue('millisecond', millisecond);
    }
  }

  /// Set the year, it won't update the [time].
  void setYear(int year) => _values['year'] = year;

  /// Set the month, it won't update the [time].
  void setMonth(int month) => _values['month'] = month;

  /// Set the date, it won't update the [time].
  void setDate(int date) => _values['date'] = date;

  /// Set the hour, it won't update the [time].
  void setHour(int hour) => _values['hour'] = hour;

  /// Set the minute, it won't update the [time].
  void setMinute(int minute) => _values['minute'] = minute;

  /// Set the second, it won't update the [time].
  void setSecond(int second) => _values['second'] = second;

  /// Set the millisecond, it won't update the [time].
  void setMillisecond(int millisecond) => _values['millisecond'] = millisecond;

  /// Set by key and val, it won't update the [time].
  void setValue(String key, int val) {
    if (_values.containsKey(key)) {
      _values[key] = val;
    }
  }

  /// Alias of [_updateTime].
  ///
  /// Updates [_time] by [_values], used publicly.
  void finished() => _updateTime();

  /// Get value by unit. Support shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// get('date');
  /// get('d');
  /// ```
  get(String unit) {
    final processedUnit = U.processUnit(unit);

    return _values.containsKey(processedUnit) ? _values[processedUnit] : null;
  }

  /// Set val by unit. Support shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// set('date', 1);
  /// set('d', 1);
  /// ```
  void set(String unit, int val) {
    final processedUnit = U.processUnit(unit);

    if (_values.containsKey(processedUnit)) {
      _values[processedUnit] = val;
    }
  }

  /// Add val by unit. Support shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// add(1, 'date');
  /// add(1, 'd');
  /// ```
  add(int val, String unit) {
    final processedUnit = U.processUnit(unit);
    final duration = U.durationFromUnit(val, processedUnit);

    if (duration != null) {
      final d = clone();
      d._time = d.time.add(duration);
      d._parseTime();
      return d;
    } else {
      if (unit == 'year') {
        return _cloneAndSetSingleValue('year', year() + val);
      } else if (unit == 'month') {
        final int result = month() + val;

        final d = clone();
        d.setValue('year', d.year() + result ~/ 12);
        d.setValue('month', result % 12);
        d.finished();
        return d;
      }
    }

    return null;
  }

  /// Subtract val by unit. Support shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// subtract(1, 'date');
  /// subtract(1, 'd');
  /// ```
  subtract(int val, String unit) {
    final processedUnit = U.processUnit(unit);
    final duration = U.durationFromUnit(val, processedUnit);

    if (duration != null) {
      final d = clone();
      d._time = d.time.subtract(duration);
      d._parseTime();
      return d;
    } else {
      if (unit == 'year') {
        return _cloneAndSetSingleValue('year', year() - val);
      } else if (unit == 'month') {
        final int result = month() - val;

        final d = clone();
        if (result > 0) {
          d.setValue('month', result);
        } else {
          d.setValue('year', d.year() - (result.abs() ~/ 12 + 1));
          d.setValue('month', 12 - result.abs() % 12);
        }
        d.finished();
        return d;
      }
    }

    return null;
  }

  /// Alias of [add].
  inc(int val, String unit) => add(val, unit);

  /// Alias of [subtract].
  dec(int val, String unit) => subtract(val, unit);

  /// Format the [Day]'s displaying.
  ///
  /// More details, view:
  /// https://github.com/g1eny0ung/day.dart/blob/master/API.md#format-format
  String format([String format]) {
    if (format == null) {
      return toIso8601String();
    }

    return format.replaceAllMapped(RegExp(C.REGEXP_FORMAT),
        (Match m) => U.processMatchFromFormat(m, this));
  }

  /// Convert this [Day] to UTC.
  Day toUtc() {
    final d = clone();
    d._time = d.time.toUtc();
    d._parseTime();
    return d;
  }

  /// Convert this [Day] to local.
  Day toLocal() {
    final d = clone();
    d._time = d.time.toLocal();
    d._parseTime();
    return d;
  }

  /// True if this [Day] is set to UTC time.
  ///
  /// Same as the [DateTime]'s isUtc method.
  bool get isUtc => time.isUtc;

  /// Returns an ISO-8601 full-precision extended format representation of this [Day].
  ///
  /// This will call the [DateTime]'s toIso8601String method.
  String toIso8601String() => time.toIso8601String();

  /// The time zone name.
  ///
  /// This will call the [DateTime]'s timeZoneName method.
  String get timeZoneName => time.timeZoneName;

  /// The time zone offset, which is the difference between local time and UTC.
  ///
  /// This will call the [DateTime]'s timeZoneOffset method.
  Duration get timeZoneOffset => time.timeZoneOffset;

  /// Compares this day to other, returning zero if the values are equal.
  ///
  /// This will call the [DateTime]'s compareTo method.
  compareTo(Day day) => time.compareTo(day.time);

  /// Returns true if this day occurs before other day.
  ///
  /// This will call the [DateTime]'s isBefore method.
  isBefore(Day day) => time.isBefore(day.time);

  /// Returns true if this day occurs after other day.
  ///
  /// This will call the [DateTime]'s isAfter method.
  isAfter(Day day) => time.isAfter(day.time);

  /// Returns a number with the difference between two days by specified unit.
  int diff(Day day, String unit) {
    final difference = time.difference(day.time);
    final processedUnit = U.processUnit(unit);

    switch (processedUnit) {
      case 'year':
        return (year() - day.year()).abs();
      case 'month':
        return (year() - day.year()).abs() * 12 + day.month() - month();
      default:
        return U.processDiffDuration(difference, processedUnit);
    }
  }

  Day _cloneAndSetSingleValue(key, val) {
    final d = clone();
    d.setValue(key, val);
    d.finished();
    return d;
  }

  /// Parses [time] to [_values], used internally.
  void _parseTime() {
    final vals = _values;

    vals['year'] = time.year;
    vals['month'] = time.month;
    vals['date'] = time.day;
    vals['weekday'] = time.weekday;
    vals['hour'] = time.hour;
    vals['minute'] = time.minute;
    vals['second'] = time.second;
    vals['millisecond'] = time.millisecond;
  }

  /// Updates [_time] by [_values], used internally.
  void _updateTime() {
    final vals = _values;

    _time = DateTime(vals['year'], vals['month'], vals['date'], vals['hour'],
        vals['minute'], vals['second'], vals['millisecond']);

    _parseTime();
  }

  @override
  int get hashCode {
    int result = 17;
    result = 31 * result + time.hashCode;
    return result;
  }

  @override
  bool operator ==(day) => day is Day && time == day.time;

  @override
  String toString() => time.toString();
}
