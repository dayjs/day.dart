import '../day.dart';

Map<String, int> getTimeValues(Day day) {
  final time = day.time;

  return {
    'year': time.year,
    'month': time.month,
    'date': time.day,
    'weekday': time.weekday,
    'hour': time.hour,
    'minute': time.minute,
    'second': time.second,
    'millisecond': time.millisecond
  };
}
