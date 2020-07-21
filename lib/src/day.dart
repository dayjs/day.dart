import 'constants.dart' show Unit, dayDartRegexpFormat;
import 'utils.dart' as u;
import 'package:day/i18n/en.dart' as en_locale;

/// A [Day] object is a [DateTime] manager.
///
/// API Documentation: https://github.com/dayjs/day.dart/blob/master/API.md
///
/// Plugins: https://github.com/dayjs/day.dart/blob/master/PLUGINS.md
///
/// I18n: https://github.com/dayjs/day.dart/blob/master/I18N.md
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

  static var _locale = en_locale.locale;

  static Map<String, dynamic> get locale => _locale;

  static set locale(Map<String, dynamic> locale) => _locale = locale;

  var _localLocale;

  Map<String, dynamic> get localLocale => _localLocale;

  Day useLocale(Map<String, dynamic> localLocale) {
    final d = clone();

    d._localLocale = localLocale;

    return d;
  }

  Map<String, dynamic> getLocale() =>
      this.localLocale != null ? this.localLocale : Day.locale;

  /// Parses [time] to [_values], used internally.
  void _parseTime() {
    final vals = _values;

    vals[Unit.y] = _time.year;
    vals[Unit.m] = _time.month;
    vals[Unit.d] = _time.day;
    vals[Unit.w] = _time.weekday;
    vals[Unit.h] = _time.hour;
    vals[Unit.min] = _time.minute;
    vals[Unit.s] = _time.second;
    vals[Unit.ms] = _time.millisecond;
  }

  _initTime(time) {
    _time = time;
    _parseTime();
  }

  /// Constructs a new [Day] instance with current date and time in the local time zone.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day();
  /// ```
  Day() {
    _initTime(DateTime.now());
  }

  /// Constructs a new [Day] based on an ISO 8601 formatted string.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromString('2019-04-30')
  /// ```
  Day.fromString(String time) {
    _initTime(DateTime.parse(time));
  }

  /// Constructs a new [Day] from a [DateTime] instance.
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromDateTime(DateTime.now());
  /// ```
  Day.fromDateTime(DateTime time) {
    _initTime(time);
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
    _initTime(DateTime.fromMillisecondsSinceEpoch(time));
  }

  /// Constructs a new [Day] from a [Day].
  ///
  /// Example:
  ///
  /// ```dart
  /// final d = Day.fromDayInstance(Day());
  /// ```
  Day.fromDayInstance(Day day) {
    _initTime(day._time);
  }

  /// Clone this [Day].
  ///
  /// returns a new [Day] instance.
  Day clone() => Day.fromDateTime(_time);

  Day _cloneAndSetSingleValue(key, val) {
    final d = clone();

    d.setValue(key, val);
    d.finished();

    return d;
  }

  /// Get or set the year of this [Day].
  ///
  /// When setting a new year, it will return a new [Day] instance with the new year.
  year([int year]) {
    if (year == null) {
      return _values[Unit.y];
    } else {
      return _cloneAndSetSingleValue(Unit.y, year);
    }
  }

  /// Get or set the month of this [Day].
  ///
  /// When setting a new month, it will return a new [Day] instance with the new month.
  month([int month]) {
    if (month == null) {
      return _values[Unit.m];
    } else {
      return _cloneAndSetSingleValue(Unit.m, month);
    }
  }

  /// Get or set the date of this [Day].
  ///
  /// When setting a new date, it will return a new [Day] instance with the new date.
  date([int date]) {
    if (date == null) {
      return _values[Unit.d];
    } else {
      return _cloneAndSetSingleValue(Unit.d, date);
    }
  }

  /// Get the weekday of this [Day].
  int weekday() {
    return _values[Unit.w];
  }

  /// Get or set the hour of this [Day].
  ///
  /// When setting a new hour, it will return a new [Day] instance with the new hour.
  hour([int hour]) {
    if (hour == null) {
      return _values[Unit.h];
    } else {
      return _cloneAndSetSingleValue(Unit.h, hour);
    }
  }

  /// Get or set the minute of this [Day].
  ///
  /// When setting a new minute, it will return a new [Day] instance with the new minute.
  minute([int minute]) {
    if (minute == null) {
      return _values[Unit.min];
    } else {
      return _cloneAndSetSingleValue(Unit.min, minute);
    }
  }

  /// Get or set the second of this [Day].
  ///
  /// When setting a new second, it will return a new [Day] instance with the new second.
  second([int second]) {
    if (second == null) {
      return _values[Unit.s];
    } else {
      return _cloneAndSetSingleValue(Unit.s, second);
    }
  }

  /// Get or set the millisecond of this [Day].
  ///
  /// When setting a new millisecond, it will return a new [Day] instance with the new millisecond.
  millisecond([int millisecond]) {
    if (millisecond == null) {
      return _values[Unit.ms];
    } else {
      return _cloneAndSetSingleValue(Unit.ms, millisecond);
    }
  }

  /// Set the year, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setYear(int year) => _values[Unit.y] = year;

  /// Set the month, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMonth(int month) => _values[Unit.m] = month;

  /// Set the date, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setDate(int date) => _values[Unit.d] = date;

  /// Set the hour, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setHour(int hour) => _values[Unit.h] = hour;

  /// Set the minute, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMinute(int minute) => _values[Unit.min] = minute;

  /// Set the second, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setSecond(int second) => _values[Unit.s] = second;

  /// Set the millisecond, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMillisecond(int millisecond) => _values[Unit.ms] = millisecond;

  /// Set by [key] and [val], it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setValue(String key, int val) {
    if (_values.containsKey(key)) {
      _values[key] = val;
    }
  }

  /// Updates the internal [_time] by [_values], used internally.
  void _updateTime() {
    final vals = _values;

    _time = DateTime(vals[Unit.y], vals[Unit.m], vals[Unit.d], vals[Unit.h],
        vals[Unit.min], vals[Unit.s], vals[Unit.ms]);

    _parseTime();
  }

  /// Alias of [_updateTime].
  ///
  /// Updates the internal [_time] by [_values], used publicly.
  void finished() => _updateTime();

  /// Get value by [String] unit. Support shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// get('date');
  /// get('d');
  /// ```
  get(String unit) {
    final processedUnit = u.processUnit(unit);

    return _values.containsKey(processedUnit) ? _values[processedUnit] : null;
  }

  /// Set val by unit. Support shorthand.
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  ///
  /// Example:
  ///
  /// ```dart
  /// set('date', 1);
  /// set('d', 1);
  /// ```
  void set(String unit, int val) {
    final processedUnit = u.processUnit(unit);

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
    final processedUnit = u.processUnit(unit);
    final duration = u.durationFromUnit(val, processedUnit);

    if (duration != null) {
      final d = clone();

      d._time = d._time.add(duration);
      d._parseTime();

      return d;
    } else {
      if (unit == Unit.y || unit == 'y') {
        return _cloneAndSetSingleValue(Unit.y, year() + val);
      } else if (unit == Unit.m || unit == 'M') {
        final int result = month() + val;

        final d = clone();
        if (result > 0) {
          d.setValue(Unit.m, result);
        } else {
          d
            ..setValue(Unit.y, d.year() - (result.abs() ~/ 12 + 1))
            ..setValue(Unit.m, 12 - result.abs() % 12);
        }
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
    final processedUnit = u.processUnit(unit);
    final duration = u.durationFromUnit(val, processedUnit);

    if (duration != null) {
      final d = clone();

      d._time = d._time.subtract(duration);
      d._parseTime();

      return d;
    } else {
      if (unit == Unit.y || unit == 'y') {
        return _cloneAndSetSingleValue(Unit.y, year() - val);
      } else if (unit == Unit.m || unit == 'M') {
        final int result = month() - val;

        final d = clone();
        if (result > 0) {
          d.setValue(Unit.m, result);
        } else {
          d
            ..setValue(Unit.y, d.year() - (result.abs() ~/ 12 + 1))
            ..setValue(Unit.m, 12 - result.abs() % 12);
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
  /// For more details, view:
  /// https://github.com/dayjs/day.dart/blob/master/API.md#format-format
  String format([String format]) {
    if (format == null) {
      return toIso8601String();
    }

    return format.replaceAllMapped(RegExp(dayDartRegexpFormat),
        (Match m) => u.processMatchFromFormat(m, this));
  }

  /// Returns an ISO-8601 full-precision extended format representation of this [Day].
  ///
  /// This will call the [DateTime]'s toIso8601String method.
  String toIso8601String() => _time.toIso8601String();

  /// The time zone name.
  ///
  /// This will call the [DateTime]'s timeZoneName method.
  String get timeZoneName => _time.timeZoneName;

  /// The time zone offset, which is the difference between local time and UTC.
  ///
  /// This will call the [DateTime]'s timeZoneOffset method.
  Duration get timeZoneOffset => _time.timeZoneOffset;

  /// Compares this day to other, returning zero if the values are equal.
  ///
  /// This will call the [DateTime]'s compareTo method.
  compareTo(Day day) => _time.compareTo(day._time);

  /// Returns true if this day occurs before other day.
  ///
  /// This will call the [DateTime]'s isBefore method.
  isBefore(Day day) => _time.isBefore(day._time);

  /// Returns true if this day occurs after other day.
  ///
  /// This will call the [DateTime]'s isAfter method.
  isAfter(Day day) => _time.isAfter(day._time);

  /// Returns a number with the difference between two days by specified unit.
  int diff(Day day, [String unit = Unit.ms]) {
    final difference = _time.difference(day._time);
    final processedUnit = u.processUnit(unit);

    switch (processedUnit) {
      case Unit.y:
        return (year() - day.year());
      case Unit.m:
        return (year() - day.year()) * 12 + (month() - day.month());
      default:
        return u.processDiffDuration(difference, processedUnit);
    }
  }

  /// True if this [Day] is set to UTC time.
  ///
  /// Same as the [DateTime]'s isUtc method.
  bool get isUtc => _time.isUtc;

  /// Convert this [Day] to UTC.
  Day toUtc() {
    final d = clone();
    d._time = d._time.toUtc();
    d._parseTime();
    return d;
  }

  /// Convert this [Day] to local.
  Day toLocal() {
    final d = clone();
    d._time = d._time.toLocal();
    d._parseTime();
    return d;
  }

  DateTime toDateTime() => _time;

  bool isValid() => _time != null;

  @override
  String toString() => _time.toString();

  // https://dart.dev/guides/libraries/library-tour#implementing-map-keys
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + _time.hashCode;
    return result;
  }

  @override
  bool operator ==(day) => day is Day && _time == day._time;
}
