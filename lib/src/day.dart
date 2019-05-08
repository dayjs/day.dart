import 'constants.dart' as C;
import 'utils.dart' as U;

class Day {
  DateTime _time;
  final Map<String, int> _values = {};

  Day() {
    _time = DateTime.now();
    _parseTime();
  }

  Day.fromString(String time) {
    _time = DateTime.parse(time);
    _parseTime();
  }

  Day.fromDateTime(DateTime time) {
    _time = time;
    _parseTime();
  }

  Day.fromUnix(int time) {
    _time = DateTime.fromMillisecondsSinceEpoch(time);
    _parseTime();
  }

  Day.fromDayInstance(Day day) {
    _time = day.time;
    _parseTime();
  }

  DateTime get time => _time;

  Day clone() => Day.fromDateTime(time);

  year([int year]) {
    if (year == null) {
      return _values['year'];
    } else {
      return _cloneAndSetSingleValue('year', year);
    }
  }

  month([int month]) {
    if (month == null) {
      return _values['month'];
    } else {
      return _cloneAndSetSingleValue('month', month);
    }
  }

  date([int date]) {
    if (date == null) {
      return _values['date'];
    } else {
      return _cloneAndSetSingleValue('date', date);
    }
  }

  weekday([int weekday]) {
    if (weekday == null) {
      return _values['weekday'];
    }
  }

  hour([int hour]) {
    if (hour == null) {
      return _values['hour'];
    } else {
      return _cloneAndSetSingleValue('hour', hour);
    }
  }

  minute([int minute]) {
    if (minute == null) {
      return _values['minute'];
    } else {
      return _cloneAndSetSingleValue('minute', minute);
    }
  }

  second([int second]) {
    if (second == null) {
      return _values['second'];
    } else {
      return _cloneAndSetSingleValue('second', second);
    }
  }

  millisecond([int millisecond]) {
    if (millisecond == null) {
      return _values['millisecond'];
    } else {
      return _cloneAndSetSingleValue('millisecond', millisecond);
    }
  }

  setYear(int year) => _values['year'] = year;

  setMonth(int month) => _values['month'] = month;

  setDate(int date) => _values['date'] = date;

  setHour(int hour) => _values['hour'] = hour;

  setMinute(int minute) => _values['minute'] = minute;

  setSecond(int second) => _values['second'] = second;

  setMillisecond(int millisecond) => _values['millisecond'] = millisecond;

  setValue(String key, int val) {
    if (_values.containsKey(key)) {
      _values[key] = val;
    }
  }

  finished() => _updateTime();

  get(String unit) {
    final processedUnit = U.processUnit(unit);

    return _values.containsKey(processedUnit) ? _values[processedUnit] : null;
  }

  set(String unit, int val) {
    final processedUnit = U.processUnit(unit);

    if (_values.containsKey(processedUnit)) {
      _values[processedUnit] = val;
    }
  }

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

  inc(int val, String unit) => add(val, unit);

  dec(int val, String unit) => subtract(val, unit);

  format([String format]) {
    if (format == null) {
      return toIso8601String();
    }

    return format.replaceAllMapped(RegExp(C.REGEXP_FORMAT),
        (Match m) => U.processMatchFromFormat(m, this));
  }

  toUtc() {
    final d = clone();
    d._time = d.time.toUtc();
    d._parseTime();
    return d;
  }

  toLocal() {
    final d = clone();
    d._time = d.time.toLocal();
    d._parseTime();
    return d;
  }

  bool get isUtc => time.isUtc;

  toIso8601String() => time.toIso8601String();

  String get timeZoneName => time.timeZoneName;

  int get timeZoneOffset => time.timeZoneOffset.inHours;

  compareTo(Day day) => time.compareTo(day.time);

  isBefore(Day day) => time.isBefore(day.time);

  isAfter(Day day) => time.isAfter(day.time);

  diff(Day day, String unit) {
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

  _cloneAndSetSingleValue(key, val) {
    final d = clone();
    d.setValue(key, val);
    d.finished();
    return d;
  }

  _parseTime() {
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

  _updateTime() {
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
