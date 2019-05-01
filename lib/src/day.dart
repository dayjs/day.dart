class Day {
  DateTime _time;
  final Map<String, int> _values = <String, int>{};

  Day() {
    this._time = DateTime.now();
    this._parseTime();
  }

  Day.fromString(String time) {
    this._time = DateTime.parse(time);
    this._parseTime();
  }

  Day.fromDateTime(DateTime time) {
    this._time = time;
    this._parseTime();
  }

  Day.fromUnix(int time) {
    this._time = DateTime.fromMillisecondsSinceEpoch(time);
    this._parseTime();
  }

  Day.fromDayInstance(Day day) {
    this._time = day.time;
    this._parseTime();
  }

  DateTime get time {
    return this._time;
  }

  Day clone() {
    return Day.fromDateTime(this.time);
  }

  year([int year]) {
    if (year == null) {
      return this._values['year'];
    } else {
      return this._cloneAndSetSingleValue('year', year);
    }
  }

  month([int month]) {
    if (month == null) {
      return this._values['month'];
    } else {
      return this._cloneAndSetSingleValue('month', month);
    }
  }

  weekday([int weekday]) {
    if (weekday == null) {
      return this._values['weekday'];
    }
  }

  date([int date]) {
    if (date == null) {
      return this._values['date'];
    } else {
      return this._cloneAndSetSingleValue('date', date);
    }
  }

  hour([int hour]) {
    if (hour == null) {
      return this._values['hour'];
    } else {
      return this._cloneAndSetSingleValue('hour', hour);
    }
  }

  minute([int minute]) {
    if (minute == null) {
      return this._values['minute'];
    } else {
      return this._cloneAndSetSingleValue('minute', minute);
    }
  }

  second([int second]) {
    if (second == null) {
      return this._values['second'];
    } else {
      return this._cloneAndSetSingleValue('second', second);
    }
  }

  millisecond([int millisecond]) {
    if (millisecond == null) {
      return this._values['millisecond'];
    } else {
      return this._cloneAndSetSingleValue('millisecond', millisecond);
    }
  }

  setYear(int year) => this._values['year'] = year;

  setMonth(int month) => this._values['month'] = month;

  setDate(int date) => this._values['date'] = date;

  setHour(int hour) => this._values['hour'] = hour;

  setMinute(int minute) => this._values['minute'] = minute;

  setSecond(int second) => this._values['second'] = second;

  setMillisecond(int millisecond) => this._values['millisecond'] = millisecond;

  setValue(key, val) {
    this._values[key] = val;
  }

  finished() {
    this._updateTime();
  }

  add(int number, String unit) {}

  _cloneAndSetSingleValue(key, val) {
    final d = this.clone();
    d.setValue(key, val);
    d.finished();
    return d;
  }

  _parseTime() {
    final time = this.time;

    this._values['year'] = time.year;
    this._values['month'] = time.month;
    this._values['weekday'] = time.weekday;
    this._values['date'] = time.day;
    this._values['hour'] = time.hour;
    this._values['minute'] = time.minute;
    this._values['second'] = time.second;
    this._values['millisecond'] = time.millisecond;
  }

  _updateTime() {
    final vals = this._values;
    this._time = DateTime(vals['year'], vals['month'], vals['date'],
        vals['hour'], vals['minute'], vals['second'], vals['millisecond']);
  }

  @override
  int get hashCode {
    int result = 17;
    result = 31 * result + time.hashCode;
    return result;
  }

  @override
  bool operator ==(day) {
    return day is Day && this.time == day.time;
  }
}
