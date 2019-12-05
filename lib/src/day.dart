import 'constants.dart' as c;
import 'utils.dart' as u;
import 'package:day/i18n/en.dart' as enLocale;

typedef dynamic DayPluginFunction(Day day);

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

  static final Map<String, DayPluginFunction> _plugins = {};

  static var _locale = enLocale.locale;
  static Map<String, dynamic> get locale => _locale;
  static set locale(Map<String, dynamic> locale) => _locale = locale;
  var _localLocale;
  Map<String, dynamic> get localLocale => _localLocale;

  useLocale(Map<String, dynamic> localLocale) {
    final d = clone();

    d._localLocale = localLocale;
    return d;
  }

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
      return _values[c.Y];
    } else {
      return _cloneAndSetSingleValue(c.Y, year);
    }
  }

  /// Get or set the month of this [Day].
  ///
  /// When setting a new month, it will return a new [Day] instance with the new month.
  month([int month]) {
    if (month == null) {
      return _values[c.M];
    } else {
      return _cloneAndSetSingleValue(c.M, month);
    }
  }

  /// Get or set the date of this [Day].
  ///
  /// When setting a new date, it will return a new [Day] instance with the new date.
  date([int date]) {
    if (date == null) {
      return _values[c.D];
    } else {
      return _cloneAndSetSingleValue(c.D, date);
    }
  }

  /// Get the weekday of this [Day].
  int weekday() {
    return _values[c.W];
  }

  /// Get or set the hour of this [Day].
  ///
  /// When setting a new hour, it will return a new [Day] instance with the new hour.
  hour([int hour]) {
    if (hour == null) {
      return _values[c.H];
    } else {
      return _cloneAndSetSingleValue(c.H, hour);
    }
  }

  /// Get or set the minute of this [Day].
  ///
  /// When setting a new minute, it will return a new [Day] instance with the new minute.
  minute([int minute]) {
    if (minute == null) {
      return _values[c.MIN];
    } else {
      return _cloneAndSetSingleValue(c.MIN, minute);
    }
  }

  /// Get or set the second of this [Day].
  ///
  /// When setting a new second, it will return a new [Day] instance with the new second.
  second([int second]) {
    if (second == null) {
      return _values[c.S];
    } else {
      return _cloneAndSetSingleValue(c.S, second);
    }
  }

  /// Get or set the millisecond of this [Day].
  ///
  /// When setting a new millisecond, it will return a new [Day] instance with the new millisecond.
  millisecond([int millisecond]) {
    if (millisecond == null) {
      return _values[c.MS];
    } else {
      return _cloneAndSetSingleValue(c.MS, millisecond);
    }
  }

  /// Set the year, it won't update the [time].
  void setYear(int year) => _values[c.Y] = year;

  /// Set the month, it won't update the [time].
  void setMonth(int month) => _values[c.M] = month;

  /// Set the date, it won't update the [time].
  void setDate(int date) => _values[c.D] = date;

  /// Set the hour, it won't update the [time].
  void setHour(int hour) => _values[c.H] = hour;

  /// Set the minute, it won't update the [time].
  void setMinute(int minute) => _values[c.MIN] = minute;

  /// Set the second, it won't update the [time].
  void setSecond(int second) => _values[c.S] = second;

  /// Set the millisecond, it won't update the [time].
  void setMillisecond(int millisecond) => _values[c.MS] = millisecond;

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
    final processedUnit = u.processUnit(unit);

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
      d._time = d.time.add(duration);
      d._parseTime();
      return d;
    } else {
      if (unit == c.Y) {
        return _cloneAndSetSingleValue(c.Y, year() + val);
      } else if (unit == c.M) {
        final int result = month() + val;

        final d = clone();
        d.setValue(c.Y, d.year() + result ~/ 12);
        d.setValue(c.M, result % 12);
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
      d._time = d.time.subtract(duration);
      d._parseTime();
      return d;
    } else {
      if (unit == c.Y) {
        return _cloneAndSetSingleValue(c.Y, year() - val);
      } else if (unit == c.M) {
        final int result = month() - val;

        final d = clone();
        if (result > 0) {
          d.setValue(c.M, result);
        } else {
          d.setValue(c.Y, d.year() - (result.abs() ~/ 12 + 1));
          d.setValue(c.M, 12 - result.abs() % 12);
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

    return format.replaceAllMapped(RegExp(c.regexpFormat),
        (Match m) => u.processMatchFromFormat(m, this));
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
    final processedUnit = u.processUnit(unit);

    switch (processedUnit) {
      case c.Y:
        return (year() - day.year()).abs();
      case c.M:
        return (year() - day.year()).abs() * 12 + day.month() - month();
      default:
        return u.processDiffDuration(difference, processedUnit);
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

    vals[c.Y] = time.year;
    vals[c.M] = time.month;
    vals[c.D] = time.day;
    vals[c.W] = time.weekday;
    vals[c.H] = time.hour;
    vals[c.MIN] = time.minute;
    vals[c.S] = time.second;
    vals[c.MS] = time.millisecond;
  }

  /// Updates [_time] by [_values], used internally.
  void _updateTime() {
    final vals = _values;

    _time = DateTime(vals[c.Y], vals[c.M], vals[c.D], vals[c.H], vals[c.MIN],
        vals[c.S], vals[c.MS]);

    _parseTime();
  }

  static Map<String, DayPluginFunction> get plugins => _plugins;

  static Map<String, DayPluginFunction> get p => _plugins;

  static void extend(String customPluginName, DayPluginFunction plugin) {
    Day._plugins[customPluginName] = plugin;
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
