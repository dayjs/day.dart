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
  late DateTime _time;

  /// The values of [_time].
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

  Map<String, dynamic>? get localLocale => _localLocale;

  Day useLocale(Map<String, dynamic> localLocale) {
    final d = clone();

    d._localLocale = localLocale;

    return d;
  }

  Map<String, dynamic> getLocale() => localLocale ?? Day.locale;

  /// Parses [_time] to [_values], used internally.
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

  void _initTime(time) {
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

  Day _cloneAndSetSingleValue(String key, val) {
    final d = clone();

    d.setValue(key, val);
    d.finished();

    return d;
  }

  Day _cloneAndSetMultipleValues(Map<String, int> values) {
    final d = clone();

    values.forEach((key, value) {
      d.setValue(key, value);
    });
    d.finished();

    return d;
  }

  /// Gets or sets the year of this [Day].
  ///
  /// When setting a new year, it will return a new [Day] instance with the new year.
  dynamic year([int? year]) {
    if (year == null) {
      return _values[Unit.y];
    } else {
      return _cloneAndSetSingleValue(Unit.y, year);
    }
  }

  /// Gets or sets the month of this [Day].
  ///
  /// When setting a new month, it will return a new [Day] instance with the new month.
  dynamic month([int? month]) {
    if (month == null) {
      return _values[Unit.m];
    } else {
      return _cloneAndSetSingleValue(Unit.m, month);
    }
  }

  /// Gets or sets the date of this [Day].
  ///
  /// When setting a new date, it will return a new [Day] instance with the new date.
  dynamic date([int? date]) {
    if (date == null) {
      return _values[Unit.d];
    } else {
      return _cloneAndSetSingleValue(Unit.d, date);
    }
  }

  /// Gets the weekday of this [Day].
  int weekday() {
    return _values[Unit.w]!;
  }

  /// Gets or sets the hour of this [Day].
  ///
  /// When setting a new hour, it will return a new [Day] instance with the new hour.
  dynamic hour([int? hour]) {
    if (hour == null) {
      return _values[Unit.h];
    } else {
      return _cloneAndSetSingleValue(Unit.h, hour);
    }
  }

  /// Gets or sets the minute of this [Day].
  ///
  /// When setting a new minute, it will return a new [Day] instance with the new minute.
  dynamic minute([int? minute]) {
    if (minute == null) {
      return _values[Unit.min];
    } else {
      return _cloneAndSetSingleValue(Unit.min, minute);
    }
  }

  /// Gets or sets the second of this [Day].
  ///
  /// When setting a new second, it will return a new [Day] instance with the new second.
  dynamic second([int? second]) {
    if (second == null) {
      return _values[Unit.s];
    } else {
      return _cloneAndSetSingleValue(Unit.s, second);
    }
  }

  /// Gets or sets the millisecond of this [Day].
  ///
  /// When setting a new millisecond, it will return a new [Day] instance with the new millisecond.
  dynamic millisecond([int? millisecond]) {
    if (millisecond == null) {
      return _values[Unit.ms];
    } else {
      return _cloneAndSetSingleValue(Unit.ms, millisecond);
    }
  }

  /// Gets [int] value by [unit]. Supports shorthand. Returns null if the [unit] is not found.
  ///
  /// Example:
  ///
  /// ```dart
  /// get('date');
  /// get('d');
  /// ```
  int? get(String unit) {
    final processedUnit = Unit.fromShorthand(unit);

    return _values.containsKey(processedUnit) ? _values[processedUnit] : null;
  }

  /// Sets the year, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setYear(int year) => _values[Unit.y] = year;

  /// Sets the month, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMonth(int month) => _values[Unit.m] = month;

  /// Sets the date, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setDate(int date) => _values[Unit.d] = date;

  /// Sets the hour, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setHour(int hour) => _values[Unit.h] = hour;

  /// Sets the minute, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMinute(int minute) => _values[Unit.min] = minute;

  /// Sets the second, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setSecond(int second) => _values[Unit.s] = second;

  /// Sets the millisecond, it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setMillisecond(int millisecond) => _values[Unit.ms] = millisecond;

  /// Sets by [key] and [val], it won't update the internal [_time].
  ///
  /// You must call [finished] method to apply all changes. Usually used in chain setting (Cascade).
  void setValue(String key, int val) {
    if (_values.containsKey(key)) {
      _values[key] = val;
    }
  }

  /// Sets [val] by [unit]. Supports shorthand. It will not do anything if the [unit] is not found.
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
    final processedUnit = Unit.fromShorthand(unit);

    if (_values.containsKey(processedUnit)) {
      _values[processedUnit] = val;
    }
  }

  /// Updates the internal [_time] by [_values].
  ///
  /// Use to apply all changes.
  void finished() {
    final vals = _values;

    _time = DateTime(
      vals[Unit.y]!,
      vals[Unit.m]!,
      vals[Unit.d]!,
      vals[Unit.h]!,
      vals[Unit.min]!,
      vals[Unit.s]!,
      vals[Unit.ms]!,
    );

    _parseTime();
  }

  Day? _add({
    required int val,
    required String unit,
    bool opposite = false,
    bool rounded = false,
  }) {
    final processedUnit = Unit.fromShorthand(unit);
    final duration = u.durationFromUnit(val, processedUnit);

    if (duration != null) {
      final d = clone();

      d._time = !opposite ? d._time.add(duration) : d._time.subtract(duration);
      d._parseTime();

      return d;
    } else {
      if (unit == Unit.y || unit == 'y') {
        final currentYear = year() + (!opposite ? val : -val);

        if (rounded) {
          final currentMonth = month();

          // First determines if the month is February to avoid over-checking
          if (currentMonth == 2 &&
              u.isDateOverflow(currentYear, currentMonth, date())) {
            return _cloneAndSetMultipleValues({
              Unit.y: currentYear,
              Unit.d: u.daysInMonth(currentYear, currentMonth),
            });
          }
        }

        return _cloneAndSetSingleValue(Unit.y, currentYear);
      } else if (unit == Unit.m || unit == 'M') {
        final d = clone();

        final int result = month() + (!opposite ? val : -val);

        if (result > 0) {
          d.setValue(Unit.m, result);
        } else {
          final abs = result.abs();

          d
            ..setValue(Unit.y, d.year() - (abs ~/ 12 + 1))
            ..setValue(Unit.m, 12 - abs % 12);
        }

        if (rounded) {
          final currentYear = d.year();
          final currentMonth = d.month();

          if (u.isDateOverflow(currentYear, currentMonth, d.date())) {
            d.setValue(Unit.d, u.daysInMonth(currentYear, currentMonth));
          }
        }

        d.finished();

        return d;
      }
    }

    return null;
  }

  /// Adds [val] by [unit]. Supports shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// add(1, 'date');
  /// add(1, 'd');
  /// ```
  Day? add(int val, String unit) => _add(val: val, unit: unit);

  /// Adds [val] by [unit] but rounded. Supports shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// addRound(1, 'month');
  /// addRound(1, 'M');
  /// ```
  Day? addRound(int val, String unit) =>
      _add(val: val, unit: unit, rounded: true);

  /// Subtracts [val] by [unit]. Supports shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// subtract(1, 'date');
  /// subtract(1, 'd');
  /// ```
  Day? subtract(int val, String unit) =>
      _add(val: val, unit: unit, opposite: true);

  /// Subtracts [val] by [unit] but rounded. Supports shorthand.
  ///
  /// Example:
  ///
  /// ```dart
  /// subtractRound(1, 'month');
  /// subtractRound(1, 'M');
  /// ```
  Day? subtractRound(int val, String unit) =>
      _add(val: val, unit: unit, opposite: true, rounded: true);

  /// Alias of [add].
  Day? inc(int val, String unit) => add(val, unit);

  /// Alias of [subtract].
  Day? dec(int val, String unit) => subtract(val, unit);

  /// Format the [Day]'s displaying.
  ///
  /// For more details, view:
  /// https://github.com/dayjs/day.dart/blob/master/API.md#format-format
  String format([String? format]) {
    if (format == null) {
      return toIso8601String();
    }

    return format.replaceAllMapped(RegExp(dayDartRegexpFormat),
        (Match m) => u.processMatchFromFormat(m, this));
  }

  @override
  String toString() => _time.toString();

  /// Returns an ISO-8601 full-precision extended format representation of this [Day].
  ///
  /// This will call the [DateTime]'s toIso8601String method.
  String toIso8601String() => _time.toIso8601String();

  /// The time zone name.
  ///
  /// Uses [DateTime.timeZoneName].
  String get timeZoneName => _time.timeZoneName;

  /// The time zone offset, which is the difference between local time and UTC.
  ///
  /// Uses [DateTime.timeZoneOffset].
  Duration get timeZoneOffset => _time.timeZoneOffset;

  /// Returns a number with the difference between two days by specified [unit].
  int diff(Day day, [String unit = Unit.ms]) {
    final difference = _time.difference(day._time);
    final processedUnit = Unit.fromShorthand(unit);

    switch (processedUnit) {
      case Unit.y:
        return (year() - day.year());
      case Unit.m:
        return (year() - day.year()) * 12 + (month() - day.month());
      default:
        return u.processDiffDuration(difference, processedUnit);
    }
  }

  /// Compares this day to other, returning zero if the values are equal.
  ///
  /// This will call the [DateTime.compareTo] method.
  int compareTo(Day day) => _time.compareTo(day._time);

  /// Returns true if this day occurs before other day.
  ///
  /// This will call the [DateTime.isBefore] method.
  bool isBefore(Day day) => _time.isBefore(day._time);

  /// Returns true if this day occurs after other day.
  ///
  /// This will call the [DateTime.isAfter] method.
  bool isAfter(Day day) => _time.isAfter(day._time);

  /// True if this [Day] is set to UTC time.
  ///
  /// Uses [DateTime.isUtc].
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

  // https://dart.dev/guides/libraries/library-tour#implementing-map-keys
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + _time.hashCode;
    return result;
  }

  @override
  bool operator ==(day) => day is Day && _time == day._time;
}
