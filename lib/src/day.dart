import 'constants.dart';

const _C = Constants;

class Day {
  DateTime _time;
  int _year;
  int _month;
  int _day;
  int _hour;
  int _minute;
  int _second;
  int _millisecond;

  Day() {
    this._time = DateTime.now();
    this._parseTime();
  }

  Day.fromString(String date) {
    this._time = DateTime.parse(date);
    this._parseTime();
  }

  Day.fromDateTime(DateTime date) {
    this._time = date;
    this._parseTime();
  }

  Day.fromUnix(int date) {
    this._time = DateTime.fromMillisecondsSinceEpoch(date);
    this._parseTime();
  }

  _parseTime() {
    final time = this._time;

    this._year = time.year;
    this._month = time.month;
    this._day = time.day;
    this._hour = time.hour;
    this._minute = time.minute;
    this._second = time.second;
    this._millisecond = time.millisecond;
  }

  DateTime get time {
    return this._time;
  }
}
