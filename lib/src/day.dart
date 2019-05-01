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

  DateTime get time {
    return _time;
  }

  Day clone() {
    return Day.fromDateTime(time);
  }

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

  weekday([int weekday]) {
    if (weekday == null) {
      return _values['weekday'];
    }
  }

  date([int date]) {
    if (date == null) {
      return _values['date'];
    } else {
      return _cloneAndSetSingleValue('date', date);
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

  setValue(key, val) {
    _values[key] = val;
  }

  finished() {
    _updateTime();
  }

  get(String unit) {
    final processedUnit = U.processUnit(unit);

    if (_values.containsKey(processedUnit)) {
      return _values[processedUnit];
    }

    return null;
  }

  set(String unit, int val) {
    final processedUnit = U.processUnit(unit);

    if (_values.containsKey(processedUnit)) {
      _values[processedUnit] = val;
    }
  }

  add(int number, String unit) {}

  _cloneAndSetSingleValue(key, val) {
    final d = this.clone();
    d.setValue(key, val);
    d.finished();
    return d;
  }

  _parseTime() {
    final vals = _values;

    vals['year'] = time.year;
    vals['month'] = time.month;
    vals['weekday'] = time.weekday;
    vals['date'] = time.day;
    vals['hour'] = time.hour;
    vals['minute'] = time.minute;
    vals['second'] = time.second;
    vals['millisecond'] = time.millisecond;
  }

  _updateTime() {
    final vals = this._values;

    _time = DateTime(vals['year'], vals['month'], vals['date'], vals['hour'],
        vals['minute'], vals['second'], vals['millisecond']);
  }

  @override
  int get hashCode {
    int result = 17;
    result = 31 * result + time.hashCode;
    return result;
  }

  @override
  bool operator ==(day) {
    return day is Day && time == day.time;
  }
}
