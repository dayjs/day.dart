import 'day.dart';
import 'constants.dart' as c;

const unitMap = {
  'y': c.Y,
  'M': c.M,
  'd': c.D,
  'w': c.W,
  'h': c.H,
  'm': c.MIN,
  's': c.S,
  'ms': c.MS
};

String processUnit(String unit) {
  if (unitMap.containsKey(unit)) {
    return unitMap[unit];
  }

  return unit.trim().toLowerCase();
}

Duration durationFromUnit(int val, String unit) {
  switch (unit) {
    case c.D:
      return Duration(days: val);
    case c.H:
      return Duration(hours: val);
    case c.MIN:
      return Duration(minutes: val);
    case c.S:
      return Duration(seconds: val);
    case c.MS:
      return Duration(milliseconds: val);
    default:
      return null;
  }
}

int processDiffDuration(Duration duration, String unit) {
  switch (unit) {
    case c.D:
      return duration.inDays.abs();
    case c.H:
      return duration.inHours.abs();
    case c.MIN:
      return duration.inMinutes.abs();
    case c.S:
      return duration.inSeconds.abs();
    case c.MS:
      return duration.inMilliseconds.abs();
    default:
      return null;
  }
}

String processMatchFromFormat(Match m, Day day) {
  final locale = day.localLocale != null ? day.localLocale : Day.locale;

  switch (m[0]) {
    case 'Y':
    case 'YY':
      final year = day.year().toString();

      return year.substring(year.length - 2, year.length);
    case 'YYY':
    case 'YYYY':
      return day.year().toString();
    case 'M':
      return day.month().toString();
    case 'MM':
      return day.month().toString().padLeft(2, '0');
    case 'MMM':
      return locale['Name'] == 'en'
          ? locale['Months'][day.month()].substring(0, 3)
          : locale['MonthsShort'][day.month()];
    case 'MMMM':
      return locale['Months'][day.month()];
    case 'D':
      return day.date().toString();
    case 'DD':
      return day.date().toString().padLeft(2, '0');
    case 'W':
      return day.weekday().toString();
    case 'WW':
      return locale['Name'] == 'en'
          ? locale['Weekdays'][day.weekday()].substring(0, 2)
          : locale['WeekdaysMin'][day.weekday()];
    case 'WWW':
      return locale['Name'] == 'en'
          ? locale['Weekdays'][day.weekday()].substring(0, 3)
          : locale['WeekdaysShort'][day.weekday()];
    case 'WWWW':
      return locale['Weekdays'][day.weekday()];
    case 'H':
      return day.hour().toString();
    case 'HH':
      return day.hour().toString().padLeft(2, '0');
    case 'h':
      return _getHourAs12(day.hour()).toString();
    case 'hh':
      return _getHourAs12(day.hour()).toString().padLeft(2, '0');
    case 'm':
      return day.minute().toString();
    case 'mm':
      return day.minute().toString().padLeft(2, '0');
    case 's':
      return day.second().toString();
    case 'ss':
      return day.second().toString().padLeft(2, '0');
    case 'SSS':
      return day.millisecond().toString().padLeft(3, '0');
    case 'A':
      return _toAMOrPM(day.hour(), locale);
    case 'a':
      return _toAMOrPM(day.hour(), locale, true);
    default:
      return null;
  }
}

int _getHourAs12(int hour) {
  return hour <= 12 ? hour : hour - 12;
}

String _toAMOrPM(int hour, dynamic locale, [bool toLowercase = false]) {
  final result = hour < 12 ? locale['AM'] : locale['PM'];

  return toLowercase ? result.toLowerCase() : result;
}
