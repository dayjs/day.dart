import 'day.dart';
import 'constants.dart' show Unit;

const unitMap = {
  'y': Unit.y,
  'M': Unit.m,
  'd': Unit.d,
  'w': Unit.w,
  'h': Unit.h,
  'm': Unit.min,
  's': Unit.s,
  'ms': Unit.ms
};

String processUnit(String unit) {
  if (unitMap.containsKey(unit)) {
    return unitMap[unit];
  }

  return unit.trim().toLowerCase();
}

Duration durationFromUnit(int val, String unit) {
  switch (unit) {
    case Unit.d:
      return Duration(days: val);
    case Unit.h:
      return Duration(hours: val);
    case Unit.min:
      return Duration(minutes: val);
    case Unit.s:
      return Duration(seconds: val);
    case Unit.ms:
      return Duration(milliseconds: val);
    default:
      return null;
  }
}

int processDiffDuration(Duration duration, String unit) {
  switch (unit) {
    case Unit.d:
      return duration.inDays;
    case Unit.h:
      return duration.inHours;
    case Unit.min:
      return duration.inMinutes;
    case Unit.s:
      return duration.inSeconds;
    case Unit.ms:
      return duration.inMilliseconds;
    default:
      return null;
  }
}

String processMatchFromFormat(Match m, Day day) {
  final locale = day.getLocale();

  if (m[0].startsWith('[') && m[0].endsWith(']')) {
    return m[0].substring(1, m[0].length - 1);
  }

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
